//
//  Coordinator.swift
//  ColorKit
//
//  Created by Руслан Ахмадеев on 06.03.2021.
//

import Foundation

class Coordinator<View>: Flow where View: FlowHolder {
    
    weak var view: View?
    
    init(view: View) {
        self.view = view
        view.flow = self
    }
    
    func start() {}
} 
