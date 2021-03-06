//
//  PhotoLibraryController.swift
//  ColorKit
//
//  Created by Руслан Ахмадеев on 05.03.2021.
//

import UIKit

protocol PhotoLibraryControllerInput {
    func got(photoPreviews: [PhotoPreview])
}

class PhotoLibraryController: UIViewController {
    
    // MARK: - Properties
    
    var presenter: PhotoLibraryPresenterInput?
    
    private var models: [PhotoPreview] = []
    
    // MARK: - UI
    
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView()
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
    }
    
    func updateView() {
        presenter?.viewIsReady()
    }
    
}

// MARK: - PhotoLibraryControllerInput

extension PhotoLibraryController: PhotoLibraryControllerInput {
    func got(photoPreviews: [PhotoPreview]) {
        models = photoPreviews
        collectionView.reloadData()
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

