//
//  DetaledPhotoModule.swift
//  ColorKit
//
//  Created by Руслан Ахмадеев on 07.03.2021.
//

import UIKit

protocol DetaledPhotoModule: class {
}

protocol DetaledPhotoView: View {
    func showPhoto(photo: UIImage)
}

protocol DetaledPhotoPresenter: class {
    func viewIsReady()
}
