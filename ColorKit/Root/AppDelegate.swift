//
//  AppDelegate.swift
//  ColorKit
//
//  Created by Руслан Ахмадеев on 05.03.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    lazy var rootManager = RootManager(window: UIWindow())
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }
}

