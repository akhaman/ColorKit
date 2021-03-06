//
//  PhotoLibraryPresenterImpl.swift
//  ColorKit
//
//  Created by Руслан Ахмадеев on 06.03.2021.
//

import UIKit

class PhotoLibraryPresenterImpl<V: PhotoLibraryView>: Presenter<V>, PhotoLibraryModule {
    
    // MARK: - PhotoLibraryModule
    
    var didComplete: ((UIImage) -> Void)?
}

// MARK: - PhotoLibraryPresenter

extension PhotoLibraryPresenterImpl: PhotoLibraryPresenter {
    
}
