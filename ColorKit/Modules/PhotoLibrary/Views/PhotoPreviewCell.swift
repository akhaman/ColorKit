//
//  CollectionViewCell.swift
//  ColorKit
//
//  Created by Руслан Ахмадеев on 05.03.2021.
//

import UIKit
import SnapKit

class PhotoPreviewCell: UICollectionViewCell, Fillable, SizeAnimatableView {
    
    // MARK: - UI
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Utils
    
    private var photo: UIImage?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image.clear()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isHighlighted: Bool {
        didSet {
            resize(isHighlighted: isHighlighted)
        }
    }
    
    // MARK: - Fillable
    
    func filled(with image: UIImage) -> Self {
        imageView.image = image
        
        return self
    }
    
    // MARK: - Helpers
    
    private func setupView() {
        contentView.addSubview(imageView)
        
        imageView.snp.makeConstraints { maker in
            maker.top.equalToSuperview()
            maker.left.equalToSuperview()
            maker.right.equalToSuperview()
            maker.bottom.equalToSuperview()
        }
        
        imageView.layer.cornerRadius = 5
    }
}
