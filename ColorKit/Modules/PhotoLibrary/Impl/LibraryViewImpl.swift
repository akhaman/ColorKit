//
//  LibraryViewImpl.swift
//  ColorKit
//
//  Created by Руслан Ахмадеев on 17.03.2021.
//

import UIKit
import Photos
import PhotosUI

class LibraryViewImpl: UIViewController {
    
    var fetchResult: PHFetchResult<PHAsset> = .init()
    
    var assets: [PHAsset] = []
    
    private let imageManager = PHCachingImageManager()
    
    lazy var addButton = UIBarButtonItem(
        barButtonSystemItem: .add,
        target: self,
        action: nil
    )
    
    private var flowLayout = UICollectionViewFlowLayout()
    
    private var cellSize: CGSize!
    
    private var previousPreheatRect = CGRect.zero
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let width = view.bounds.inset(by: view.safeAreaInsets).width
    }
    
    deinit {
    }
    
    // MARK: - Cache Handlers
    
    func updateCachedAssets() {
        
    }
    
    func resetCachedAssets() {
        
    }
}

// MARK: - Collection View Data Source

extension LibraryViewImpl: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        assets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let asset = assets.get(indexPath.row) else {
            fatalError()
        }
        
        guard let cell = collectionView.cell(ofType: PhotoPreviewCell.self, for: indexPath) else {
            fatalError()
        }
        
        cell.representedIdentifier = asset.localIdentifier
        imageManager.requestImage(
            for: asset,
            targetSize: cellSize,
            contentMode: .default,
            options: nil
        ) { image, _ in
            guard cell.representedIdentifier == asset.localIdentifier else { return }
            cell.photo = image
        }
        
        return cell
    }
}

// MARK: - Scroll View Delegate

extension LibraryViewImpl: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateCachedAssets()
    }
}
