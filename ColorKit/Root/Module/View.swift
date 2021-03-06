//
//  View.swift
//  ColorKit
//
//  Created by Руслан Ахмадеев on 06.03.2021.
//

import Foundation

protocol View: class {
    associatedtype PresenterType
    var presenter: PresenterType? { get set }
}
