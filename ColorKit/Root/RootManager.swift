//
//  RootManager.swift
//  ColorKit
//
//  Created by Руслан Ахмадеев on 05.03.2021.
//

import UIKit

class RootManager {
    private let mainWindow: UIWindow
    
    init(window: UIWindow) {
        self.mainWindow = window
    }
    
    func setup() {
        let tabBarController = TabBarController()
        mainWindow.rootViewController = tabBarController
        mainWindow.makeKeyAndVisible()
    }
}
