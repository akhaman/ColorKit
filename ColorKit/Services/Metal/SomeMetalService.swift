//
//  SomeMetalService.swift
//  ColorKit
//
//  Created by Руслан Ахмадеев on 10.03.2021.
//

import Metal
import MetalKit
import SnapKit


class GraphicsContext: NSObject {
    let device: MTLDevice
    let commandQueue: MTLCommandQueue
    let textureLoader: MTKTextureLoader
    let library: MTLLibrary
    
    init?(device: MTLDevice? = MTLCreateSystemDefaultDevice()) {
        guard let device = device,
              let commandQueue = device.makeCommandQueue(),
              let library = device.makeDefaultLibrary() else {
            return nil
        }
        
        self.device = device
        self.commandQueue = commandQueue
        self.textureLoader = MTKTextureLoader(device: device)
        self.library = library
    }
}

class MetalRenderer: NSObject, MTKViewDelegate {
   
    let device: MTLDevice
    let view: MTKView
        
    init(device: MTLDevice, view: MTKView) {
        self.device = device
        self.view = view
        super.init()
        loadResources()
    }
    
    private func loadResources() {
        
    }
    
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
        
    }
    
    func draw(in view: MTKView) {
        
    }
}

class DetailPhotoViewImpl: UIViewController {
    
    let renderer: MetalRenderer
    
    private var mtkView: MTKView!
    
    init(renderer: MetalRenderer) {
        self.renderer = renderer
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupMetal() {
        mtkView.delegate = renderer
    }
    
}
