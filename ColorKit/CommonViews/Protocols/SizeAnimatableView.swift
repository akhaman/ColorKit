//
//  SizeAnimatableView.swift
//  ColorKit
//
//  Created by Руслан Ахмадеев on 06.03.2021.
//

import UIKit

protocol SizeAnimatableView: UIView {
    func resize(isHighlighted: Bool)
}

extension SizeAnimatableView {
    func resize(isHighlighted: Bool) {
        let transform: CGAffineTransform = isHighlighted ? .init(scaleX: 0.9, y: 0.9) : .identity
       
        UIView.animate(
            withDuration: 0.4,
            delay: 0,
            options: [.allowUserInteraction, .curveEaseInOut, .beginFromCurrentState]
        ) {
            self.transform = transform
        }
    }
}
