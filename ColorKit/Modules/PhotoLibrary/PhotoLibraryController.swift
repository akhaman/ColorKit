//
//  PhotoLibraryController.swift
//  ColorKit
//
//  Created by Руслан Ахмадеев on 05.03.2021.
//

import UIKit

class PhotoLibraryController: UIViewController, PhotoLibraryView {
    
    // MARK: - Properties
    
    var presenter: PhotoLibraryPresenter?
    
    private var models: [PhotoPreview] = []
    
    // MARK: - UI
    
    private lazy var collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    // MARK: - Life Cycle
    
    override func loadView() {
        view = collectionView
    }
       
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    func configureView() {
        view.backgroundColor = .blue
    }
    
    func updateView() {
    }
    
}

extension PhotoLibraryController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}

extension PhotoLibraryController: UICollectionViewDelegate {
}
