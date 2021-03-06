//
//  Array.swift
//  ColorKit
//
//  Created by Руслан Ахмадеев on 05.03.2021.
//

import UIKit

extension Array {
    func get(_ index: Int) -> Element? {
        guard count > index, index >= 0 else {
            return nil
        }
        return self[index]
    }
    
    func section(from indexPath: IndexPath) -> Element? {
        get(indexPath.section)
    }
    
    func row(from indexPath: IndexPath) -> Element? {
        get(indexPath.row)
    }
}
