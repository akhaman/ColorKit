//
//  PhotoPreview.swift
//  ColorKit
//
//  Created by Руслан Ахмадеев on 05.03.2021.
//

import UIKit

enum PhotoLibraryItem {
    case photoPreview(photo: UIImage)
    case addPhoto
}

struct PhotoPreview {
    let name: String
    let image: UIImage
}
