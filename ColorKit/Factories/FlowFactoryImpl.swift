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
        let controller = MainFlowNavigationController()
        let flow = MainFlowCoordinator(view: controller, flows: dependencies.flowFactory, modules: dependencies.moduleFactory)
        return (controller, flow)
    }
}
