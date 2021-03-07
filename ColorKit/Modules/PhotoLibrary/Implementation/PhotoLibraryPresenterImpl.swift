//
//  PhotoLibraryPresenterImpl.swift
//  ColorKit
//
//  Created by Руслан Ахмадеев on 06.03.2021.
//

import UIKit

class PhotoLibraryPresenterImpl<V: PhotoLibraryView>: Presenter<V>,
                                                      PhotoLibraryModule,
                                                      UIImagePickerControllerDelegate,
                                                      UINavigationControllerDelegate {
    // MARK: - Implementation
    
    let photoRepository: PhotoRepository
    
    init(photoRepository: PhotoRepository, view: V) {
        self.photoRepository = photoRepository
        super.init(view: view)
    }
    // MARK: - PhotoLibraryModule
    
    var addPhoto: ((_ delegate: UIImagePickerControllerDelegate & UINavigationControllerDelegate) -> Void)?
    var openPhoto: ((_ photo: UIImage) -> Void)?
    
    // MARK: - UIImagePickerControllerDelegate
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else { return }
        view?.append(items: [.photoPreview(photo: image)])
    }
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
            
            let items = photos.map { PhotoLibraryItem.photoPreview(photo: $0) }
            self.view?.replace(items: items)
        }
    }
    
    func addPhotoTapped() {
        addPhoto?(self)
    }
    
    func photoPreviewTapped(photo: UIImage) {
        openPhoto?(photo)
    }
}
