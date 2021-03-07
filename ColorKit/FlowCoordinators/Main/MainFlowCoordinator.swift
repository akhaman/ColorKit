//
//  MainFlowCoordinator.swift
//  ColorKit
//
//  Created by Руслан Ахмадеев on 06.03.2021.
//

import UIKit

class MainFlowCoordinator: Coordinator<FlowNavigationController>, MainFlow {
    
    private let flows: FlowFactory
    
    private let modules: ModuleFactory
    
    init(view: FlowNavigationController, flows: FlowFactory, modules: ModuleFactory) {
        self.flows = flows
        self.modules = modules
        super.init(view: view)
    }
    
    override func start() {
        super.start()
        view?.pushViewController(photoLibrary(), animated: true)
    }
    
    // MARK: - Helpers
    
    private func photoLibrary() -> UIViewController {
        let (viewController, module) = modules.photoLibrary()
        module.addPhoto = viewController.router.present(imagePicker)
        module.openPhoto = viewController.router.push(detailedPhoto)
        
        return viewController
    }
    
    private func imagePicker(delegate: UIImagePickerControllerDelegate & UINavigationControllerDelegate) -> UIViewController {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = delegate
        
        return imagePickerController
    }
    
    private func detailedPhoto(photo: UIImage) -> UIViewController {
        return UIViewController()
    }
}
