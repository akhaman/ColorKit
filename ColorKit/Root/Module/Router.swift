//
//  Router.swift
//  ColorKit
//
//  Created by Руслан Ахмадеев on 06.03.2021.
//

import UIKit

extension UIViewController {
    
    var router: Router {
        Router(viewController: self)
    }
}

struct Router {
    
    unowned private let viewController: UIViewController
    
    private var navigationController: UINavigationController? {
        viewController.navigationController
    }
    
    fileprivate init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    // MARK: - Transitions
    
    typealias Handler = () -> Void
    typealias InputHandler<Input> = (Input) -> Void
    typealias ControllerHandler = () -> UIViewController
    typealias InputControllerHandler<Input> = (Input) -> UIViewController
    
    // MARK: - Push
    
    func push(animated: Bool = true, _ make: @escaping ControllerHandler) -> Handler {
        return {
            let controller = make()
            navigationController?.pushViewController(controller, animated: animated)
        }
    }
    
    func push<InputType>(animated: Bool = true, _ make: @escaping InputControllerHandler<InputType>) -> InputHandler<InputType> {
        return { input in
            let controller = make(input)
            navigationController?.pushViewController(controller, animated: animated)
        }
    }
    
    // MARK: - Present
    
    func present(animated: Bool = true, _ make: @escaping ControllerHandler, completion: Handler? = nil) -> Handler {
        return {
            let controller = make()
            self.viewController.present(controller, animated: animated)
            
        }
    }
    
    func present<InputType>(animated: Bool = true, _ make: @escaping InputControllerHandler<InputType>, completion: Handler? = nil) -> InputHandler<InputType> {
        return { input in
            let controller = make(input)
            self.viewController.present(controller, animated: animated, completion: completion)
        }
    }
}
