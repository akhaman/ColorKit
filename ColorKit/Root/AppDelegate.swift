//
//  AppDelegate.swift
//  ColorKit
//
//  Created by Руслан Ахмадеев on 05.03.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    let dependendencies: Dependencies = DependenciesImpl()
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let flowFactory = dependendencies.flowFactory
        let (viewController, _) = flowFactory.main()
        
        let window = UIWindow()
        window.rootViewController = viewController
        self.window = window
        
        window.makeKeyAndVisible()
        return true
    }
}
