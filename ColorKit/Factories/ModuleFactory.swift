//
//  ModuleFactory.swift
//  ColorKit
//
//  Created by Руслан Ахмадеев on 06.03.2021.
//

import UIKit

protocol ModuleFactory {
    func photoLibrary() -> (UIViewController, PhotoLibraryModule)
}
