//
//  ImagePickerDelegate.swift
//  ColorKit
//
//  Created by Руслан Ахмадеев on 16.03.2021.
//

import UIKit
import Photos
import PhotosUI

class ImagePickerDelegate: NSObject {
    var gotAssets: ((_ assets: [PHAsset]) -> Void)?
}

extension ImagePickerDelegate: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        
        guard let asset = info[.phAsset] as? PHAsset else { return }
        gotAssets?([asset])
        picker.dismiss(animated: true, completion: nil)
    }
}

extension ImagePickerDelegate: UINavigationControllerDelegate {}
