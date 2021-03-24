//
//  PhotoPreview.swift
//  ColorKit
//
//  Created by Руслан Ахмадеев on 05.03.2021.
//

import UIKit

enum PhotoLibraryItem {
    case photoModel(model: PhotoModel)
    case addPhoto
}

struct PhotoPreview {
    let name: String
    let image: UIImage
}
