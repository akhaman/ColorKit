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
    private lazy var blurSlider = UISlider()
    private let sliderStep: Float = 1

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
        
        view.addSubview(blurSlider)
       
        blurSlider.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(40)
            $0.right.left.equalToSuperview().inset(35)
        }
        
        blurSlider.minimumValue = 0
        blurSlider.maximumValue = 100
        blurSlider.isContinuous = true
        blurSlider.addTarget(self, action: #selector(sliderValueDidChange(_:)), for: .valueChanged)
        
        presenter?.viewIsReady()
    }
    
    @objc private func sliderValueDidChange(_ sender: UISlider) {
        let roundedStepValue = round(sender.value / sliderStep) * sliderStep
        sender.value = roundedStepValue
        presenter?.blurValueChanged(change: roundedStepValue)
    }
    
    deinit {
        print("*\(self) deallocated")
    }
}

// MARK: - DetaledPhotoView

extension DetaledPhotoViewImpl: DetaledPhotoView {
    
    func showPhoto(photo: UIImage) {
        imageView.image = photo
    }
}
