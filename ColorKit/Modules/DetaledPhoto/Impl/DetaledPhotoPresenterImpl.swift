//
//  DetaledPhotoPresenterImpl.swift
//  ColorKit
//
//  Created by Руслан Ахмадеев on 07.03.2021.
//

import UIKit
import MetalKit

class DetaledPhotoPresenterImpl<V: DetaledPhotoView>: Presenter<V>, DetaledPhotoModule {
    
    // MARK: - Constants
    
    let blurChangeStep = 1
    
    // MARK: - Impl
    
    let photo: UIImage
            
    init(photo: UIImage, view: V) {
        self.photo = photo
        super.init(view: view)
    }
    
    private var currentRadius: Int = 0
    
    // MARK: - DetaledPhotoModule
}

// MARK: - DetaledPhotoPresenter

extension DetaledPhotoPresenterImpl: DetaledPhotoPresenter {

    func blurValueChanged(change: Float) {
        let newRadius = Int(change)
        
        guard !(newRadius == currentRadius) else { return }
        print("Применяем радиус \(newRadius)")
    }
    
    func viewIsReady() {
    }
}
