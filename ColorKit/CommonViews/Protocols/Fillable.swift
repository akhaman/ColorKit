//
//  Fillable.swift
//  ColorKit
//
//  Created by Руслан Ахмадеев on 06.03.2021.
//

import Foundation

protocol Fillable {
    associatedtype Model
    func filled(with model: Model) -> Self
}
