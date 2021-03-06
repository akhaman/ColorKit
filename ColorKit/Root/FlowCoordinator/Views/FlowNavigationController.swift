//
//  FlowNavigationController.swift
//  ColorKit
//
//  Created by Руслан Ахмадеев on 06.03.2021.
//

import UIKit

class FlowNavigationController: UINavigationController, FlowHolder {
    
    var flow: Flow?
    
    private var isStarted = false
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if !isStarted {
            isStarted = true
            flow?.start()
        }
    }
}
