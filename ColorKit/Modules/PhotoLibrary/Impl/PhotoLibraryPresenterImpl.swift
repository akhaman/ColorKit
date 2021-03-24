//
//  PhotoLibraryPresenterImpl.swift
//  ColorKit
//
//  Created by Руслан Ахмадеев on 06.03.2021.
//

import UIKit
import Photos

class PhotoLibraryPresenterImpl<V: PhotoLibraryView>: Presenter<V>, PhotoLibraryModule {
    // MARK: - Implementation
    
    let photoRepository: PhotoRepository
    
    private let pickerHandler = ImagePickerDelegate()
    
    init(photoRepository: PhotoRepository, view: V) {
        self.photoRepository = photoRepository
        super.init(view: view)
        
        pickerHandler.gotAssets = { image in
            
            
        }
    }
    
    // MARK: - PhotoLibraryModule
    
    var addPhoto: ((_ delegate: PickerDelegate) -> Void)?
    
    var openPhoto: ((_ photo: UIImage) -> Void)?
}

// MARK: - PhotoLibraryPresenter

extension PhotoLibraryPresenterImpl: PhotoLibraryPresenter {
    func viewIsReady() {
        photoRepository.obtainStoredPhotos { [weak self] photos in
            guard let self = self else { return }
            
            guard !photos.isEmpty else {
                self.view?.replace(items: [.addPhoto])
                return
            }
            
            let items = photos.map { PhotoLibraryItem.photoModel(model: $0) }
            self.view?.replace(items: items)
        }
    }
    
    func addPhotoTapped() {
        addPhoto?(pickerHandler)
    }
    
    func photoPreviewTapped(photo: UIImage) {
        openPhoto?(photo)
    }
}
