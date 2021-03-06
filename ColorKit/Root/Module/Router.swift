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
    
    func push(animated: Bool = true, _ make: @escaping () -> UIViewController) -> (() -> Void) {
        return {
            let controller = make()
            navigationController?.pushViewController(controller, animated: animated)
        }
    }
    
    func push<Input>(animated: Bool = true, _ make: @escaping (Input) -> UIViewController) -> ((Input) -> Void) {
        return { input in
            let controller = make(input)
            navigationController?.pushViewController(controller, animated: animated)
        }
    }
}
