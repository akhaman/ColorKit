//
//  Presenter.swift
//  ColorKit
//
//  Created by Руслан Ахмадеев on 06.03.2021.
//

import Foundation

class Presenter<V: View> {
    
    private weak var view: V?
    
    init(view: V) {
        guard let presenter = self as? V.PresenterType else {
            fatalError("Type of Presenter is wrong")
        }
        
        self.view = view
        view.presenter = presenter
    }
}
