//
//  Presenter.swift
//  ColorKit
//
//  Created by Руслан Ахмадеев on 06.03.2021.
//

import Foundation

class Presenter<V: View>: NSObject {
    
    weak var view: V?
    
    init(view: V) {
        super.init()
        guard let presenter = self as? V.PresenterType else {
            fatalError("Type of Presenter is wrong")
        }
        
        self.view = view
        view.presenter = presenter
    }
}
