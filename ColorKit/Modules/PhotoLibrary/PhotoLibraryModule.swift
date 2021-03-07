//
//  PhotoLibraryModule.swift
//  ColorKit
//
//  Created by Руслан Ахмадеев on 06.03.2021.
//

import UIKit

protocol PhotoLibraryModule: class {
    var addPhoto: ((_ delegate: UIImagePickerControllerDelegate & UINavigationControllerDelegate) -> Void)? { get set }
    var openPhoto: ((_ photo: UIImage) -> Void)? { get set }
}

protocol PhotoLibraryView: View {
    func replace(items: [PhotoLibraryItem])
    func append(items: [PhotoLibraryItem])
}

protocol PhotoLibraryPresenter: class {
    func viewIsReady()
    func addPhotoTapped()
    func photoPreviewTapped(photo: UIImage)
}
