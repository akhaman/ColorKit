//
//  CollectionView.swift
//  ColorKit
//
//  Created by Руслан Ахмадеев on 05.03.2021.
//

import UIKit

extension UICollectionView {
    func register(_ cellTypes: UICollectionViewCell.Type...) {
        cellTypes.forEach {
            register($0, forCellWithReuseIdentifier: "\($0)")
        }
    }
    
    func cell<Cell>(ofType cellType: Cell.Type, for indexPath: IndexPath) -> Cell? where Cell: UICollectionViewCell {
        dequeueReusableCell(withReuseIdentifier: "\(cellType)", for: indexPath) as? Cell
    }
}
