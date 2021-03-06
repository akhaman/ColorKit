//
//  ModuleFactoryImpl.swift
//  ColorKit
//
//  Created by Руслан Ахмадеев on 06.03.2021.
//

import UIKit

class ModuleFactoryImpl: ModuleFactory {
    
    private let dependencies: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func photoLibrary() -> (UIViewController, PhotoLibraryModule) {
        let controller = PhotoLibraryController()
        let presenter = PhotoLibraryPresenterImpl(view: controller)
        return (controller, presenter)
    }
}
