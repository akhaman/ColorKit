//
//  FlowFactory.swift
//  ColorKit
//
//  Created by Руслан Ахмадеев on 06.03.2021.
//

import UIKit

protocol FlowFactory {
    func main() -> (UIViewController, MainFlow)
}
