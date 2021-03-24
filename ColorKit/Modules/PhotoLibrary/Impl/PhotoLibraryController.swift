//
//  PhotoLibraryController.swift
//  ColorKit
//
//  Created by Руслан Ахмадеев on 05.03.2021.
//

import UIKit

class PhotoLibraryController: UIViewController {
    
    // MARK: - Properties
    
    var presenter: PhotoLibraryPresenter?
    
    private var items: [PhotoLibraryItem] = []
    
    // MARK: - UI
    
    private let itemsPerRow: CGFloat = 3

    private let sectionInsets = UIEdgeInsets(top: 50, left: 20, bottom: 50, right: 20)
    
    private var itemSize: CGSize {
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    private lazy var collectionView: UICollectionView = {
        let layot = UICollectionViewFlowLayout()
        layot.sectionInset = sectionInsets
        layot.itemSize = itemSize
        
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layot)
        collectionView.register(PhotoPreviewCell.self, UICollectionViewCell.self)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        
        return collectionView
    }()
    
    // MARK: - Life Cycle
       
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        view.addSubview(collectionView)
        presenter?.viewIsReady()
    }
}

// MARK: - PhotoLibraryView

extension PhotoLibraryController: PhotoLibraryView {
    
    func append(items: [PhotoLibraryItem]) {
        self.items.insert(contentsOf: items, at: 0)
        collectionView.reloadData()
    }
    
    func replace(items: [PhotoLibraryItem]) {
        self.items = items
        collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDataSource

extension PhotoLibraryController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = items.row(from: indexPath) else { return UICollectionViewCell() }
        
        var cell: UICollectionViewCell?

        switch item {
        case .addPhoto:
            cell = collectionView.cell(ofType: PhotoPreviewCell.self, for: indexPath)?
                .filled(with: Images.addPhoto)
        case .photoModel(let photo):
            break
//            cell = collectionView.cell(ofType: PhotoPreviewCell.self, for: indexPath)?
//                .filled(with: )
        }

        return cell ?? UICollectionViewCell()
    }
}

// MARK: - UICollectionViewDelegate

extension PhotoLibraryController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let item = items.row(from: indexPath) else { return }
        
        switch item {
        case .addPhoto:
            presenter?.addPhotoTapped()
        case .photoModel(let photo):
            break
//            presenter?.photoPreviewTapped(photo: photo)
        }
    }
}
