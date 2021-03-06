//
//  PhotoLibraryModule.swift
//  ColorKit
//
//  Created by Руслан Ахмадеев on 06.03.2021.
//

import UIKit

protocol PhotoLibraryModule: class {
    var didComplete: ((_ photo: UIImage) -> Void)? { get set }
}

protocol PhotoLibraryView: View {
}

protocol PhotoLibraryPresenter: class {
}
