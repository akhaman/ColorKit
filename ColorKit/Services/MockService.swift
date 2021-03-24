//
//  MockService.swift
//  ColorKit
//
//  Created by Руслан Ахмадеев on 07.03.2021.
//

import UIKit

class MockService {}

extension MockService: PhotoRepository {
    func obtainStoredPhotos(completion: @escaping ([PhotoModel]) -> Void) {
        completion([])
    }
    
    func savePhotos(photos: [PhotoModel]) {
        
    }
}
