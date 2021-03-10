//
//  PhotoRepository.swift
//  ColorKit
//
//  Created by Руслан Ахмадеев on 07.03.2021.
//

import UIKit

protocol PhotoRepository {
    func obtainStoredPhotos(completion: @escaping (_ images: [UIImage]) -> Void)
}
