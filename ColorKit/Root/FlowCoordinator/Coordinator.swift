//
//  Coordinator.swift
//  ColorKit
//
//  Created by Руслан Ахмадеев on 06.03.2021.
//

import Foundation

class Coordinator<View>: NSObject, Flow where View: FlowHolder {
    
    weak var view: View?
    
    init(view: View) {
        super.init()
        self.view = view
        view.flow = self
    }
    
    func start() {}
} 
