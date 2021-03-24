//
//  FlowFactoryImpl.swift
//  ColorKit
//
//  Created by Руслан Ахмадеев on 06.03.2021.
//

import UIKit

class FlowFactoryImpl: FlowFactory {
    
    private let dependencies: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func main() -> (UIViewController, MainFlow) {
        let navigationController = MainFlowNavigationController()
        let flow = MainFlowCoordinator(view: navigationController, flows: dependencies.flowFactory, modules: dependencies.moduleFactory)
        return (navigationController, flow)
    }
}
