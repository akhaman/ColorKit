//
//  DetaledPhotoPresenterImpl.swift
//  ColorKit
//
//  Created by Руслан Ахмадеев on 07.03.2021.
//

import UIKit

class DetaledPhotoPresenterImpl<V: DetaledPhotoView>: Presenter<V>, DetaledPhotoModule {
    
    // MARK: - Impl
    
    let photo: UIImage
    
    init(photo: UIImage, view: V) {
        self.photo = photo
        super.init(view: view)
    }
    
    // MARK: - DetaledPhotoModule
}

// MARK: - DetaledPhotoPresenter

extension DetaledPhotoPresenterImpl: DetaledPhotoPresenter {
    
    func viewIsReady() {
        view?.showPhoto(photo: photo)
    }
}
