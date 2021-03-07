//
//  PhotoLibraryViewImpl.swift
//  ColorKit
//
//  Created by Руслан Ахмадеев on 07.03.2021.
//

import SnapKit

class DetaledPhotoViewImpl: UIViewController {
    
    var presenter: DetaledPhotoPresenter?
    
    private lazy var imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.addSubview(imageView)
        view.backgroundColor = .white
        imageView.contentMode = .scaleAspectFit
        
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        presenter?.viewIsReady()
    }
    
    deinit {
        print("*\(self) deallocated" )
    }
}

// MARK: - DetaledPhotoView

extension DetaledPhotoViewImpl: DetaledPhotoView {
    
    func showPhoto(photo: UIImage) {
        imageView.image = photo
    }
}
