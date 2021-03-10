//
//  DetaledPhotoModule.swift
//  ColorKit
//
//  Created by Руслан Ахмадеев on 07.03.2021.
//

import UIKit
import MetalKit

protocol DetaledPhotoModule: class {
}

protocol DetaledPhotoView: View {
    func showPhoto(photo: UIImage)
}

protocol DetaledPhotoPresenter: class {    
    func viewIsReady()
    func blurValueChanged(change: Float)
}
