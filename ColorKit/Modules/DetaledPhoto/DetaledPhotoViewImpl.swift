//
//  PhotoLibraryViewImpl.swift
//  ColorKit
//
//  Created by Руслан Ахмадеев on 07.03.2021.
//

import SnapKit

class DetaledPhotoViewImpl: UIViewController {
    
    var presenter: DetaledPhotoPresenter?
    
    private lazy var imageView = UIImageView()
    private lazy var blurSlider = UISlider()
    
    private var originalPhoto: UIImage? {
        didSet {
            guard let originalPhoto = originalPhoto else { return }
            let originalCIPhoto = CIImage(image: originalPhoto)
            self.originalCIPhoto = originalCIPhoto
            filter?.setValue(originalCIPhoto, forKey: kCIInputImageKey)
        }
    }
    
    private var originalCIPhoto: CIImage?
    
    let filter = CIFilter(name: "CIGaussianBlur")
    
    private lazy var context = CIContext()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.addSubview(imageView)
        view.backgroundColor = .white
        imageView.contentMode = .scaleAspectFit
        
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        view.addSubview(blurSlider)
        
        blurSlider.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(40)
            $0.right.left.equalToSuperview().inset(35)
        }
        
        blurSlider.minimumValue = 0
        blurSlider.maximumValue = 100
        blurSlider.isContinuous = true
        
        blurSlider.addTarget(self, action: #selector(sliderValueDidChange(_:)), for: .valueChanged)
        
        presenter?.viewIsReady()
    }
    
    @objc private func sliderValueDidChange(_ sender: UISlider) {
        
        guard let originalPhoto = originalPhoto,
              let image = originalCIPhoto ?? CIImage(image: originalPhoto) else { return }
        
        let orientation = originalPhoto.imageOrientation
        
        let changedValue = Int(sender.value)
        
//        filter?.setValue(image, forKey: kCIInputImageKey)
        filter?.setValue(changedValue, forKey: kCIInputRadiusKey)

        guard let outputImage = filter?.outputImage else { return }
        
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else { return }
        
        let newImage = UIImage(cgImage: cgImage, scale: 1, orientation: orientation)
        
        imageView.image = newImage
    }
    
    deinit {
        print("*\(self) deallocated")
    }
}

// MARK: - DetaledPhotoView

extension DetaledPhotoViewImpl: DetaledPhotoView {
    
    func showPhoto(photo: UIImage) {
        originalPhoto = photo
        imageView.image = photo
    }
}
