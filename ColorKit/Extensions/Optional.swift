//
//  Optional.swift
//  ColorKit
//
//  Created by Руслан Ахмадеев on 06.03.2021.
//

import Foundation

extension Optional {
    mutating func clear() {
        self = .none
    }
}
