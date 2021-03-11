//
//  DetaledPhotoViewMetal.swift
//  ColorKit
//
//  Created by Руслан Ахмадеев on 11.03.2021.
//

import SnapKit
import MetalKit

class DetaledPhotoViewMetalImpl: UIViewController {
    
    var presenter: DetaledPhotoPresenter?
    
    private lazy var blurSlider = UISlider()
    private lazy var metalView = MTKView()
    private var commandQueue: MTLCommandQueue?
    let colorSpace = CGColorSpaceCreateDeviceRGB()
    
    private var originalPhoto: UIImage? {
        didSet {
            guard let originalPhoto = originalPhoto else { return }
            let originalCIPhoto = CIImage(image: originalPhoto)
            self.originalCIPhoto = originalCIPhoto
            filter.setValue(originalCIPhoto, forKey: kCIInputImageKey)
        }
    }
    
    private var originalCIPhoto: CIImage?
    
    let filter = CIFilter(name: "CIGaussianBlur")!
    
    private lazy var context = CIContext()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMetal()
        setupView()
        presenter?.viewIsReady()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private func setupMetal() {
        view.addSubview(metalView)
        metalView.snp.makeConstraints { $0.edges.equalToSuperview() }
        
        guard let device = MTLCreateSystemDefaultDevice()  else { return }
        guard let commandQueue = device.makeCommandQueue() else { return }
        
        metalView.delegate = self
        metalView.device = device
        metalView.framebufferOnly = false
        metalView.colorPixelFormat = .bgra8Unorm
        
        metalView.isPaused = true
        metalView.enableSetNeedsDisplay = true
        
        self.commandQueue = commandQueue
    }
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(blurSlider)
        
        blurSlider.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(40)
            $0.right.left.equalToSuperview().inset(35)
        }
        
        blurSlider.minimumValue = 0
        blurSlider.maximumValue = 100
        blurSlider.isContinuous = true
        
        blurSlider.addTarget(self, action: #selector(sliderValueDidChange(_:)), for: .valueChanged)
    }
    
    @objc private func sliderValueDidChange(_ sender: UISlider) {
        metalView.setNeedsDisplay()
    }
    
    deinit {
        print("*\(self) deallocated")
    }
}

// MARK: - DetaledPhotoView

extension DetaledPhotoViewMetalImpl: DetaledPhotoView {
    
    func showPhoto(photo: UIImage) {
        originalPhoto = photo
    }
}

extension DetaledPhotoViewMetalImpl: MTKViewDelegate {
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
    }
    
    func draw(in view: MTKView) {
        let blurValue = blurSlider.value
        filter.setValue(blurValue, forKey: kCIInputRadiusKey)

        guard let commandQueue = commandQueue else { return }
        guard let drawable = view.currentDrawable else { return }
        guard let image = filter.outputImage?.cropped(to: originalCIPhoto!.extent) else { return }
        
        let drawableSize = view.drawableSize

        // ориентация
        let orientedImage = image.oriented(.right)
        
        // возвращаем размеры
        let scaleX = drawableSize.width / orientedImage.extent.width
        let scaleY = drawableSize.height / orientedImage.extent.height
        let scaleFactor = min(scaleX, scaleY)
        let scaleTransform = CGAffineTransform(scaleX: scaleFactor, y: scaleFactor)
        let scaledImage = orientedImage.transformed(by: scaleTransform)
        
        // центрируем
        let originX = max(drawableSize.width - scaledImage.extent.size.width, 0) / 2
        let originY = max(drawableSize.height - scaledImage.extent.size.height, 0) / 2
        let centeringTransform = CGAffineTransform(translationX: originX, y: originY)
        let centeredImage = scaledImage.transformed(by: centeringTransform)
        
        let buffer = commandQueue.makeCommandBuffer()!
        
        let destination = CIRenderDestination(
            width: Int(drawableSize.width),
            height: Int(drawableSize.height),
            pixelFormat: view.colorPixelFormat,
            commandBuffer: buffer) { () -> MTLTexture in
            return drawable.texture
        }
        
        guard let task = try? context.startTask(toRender: centeredImage, to: destination) else { return }
        
        buffer.present(drawable)
        buffer.commit()
        
        DispatchQueue.global(qos: .background).async {
            guard let info = try? task.waitUntilCompleted() else { return }
            print(info)
        }
    }
}
