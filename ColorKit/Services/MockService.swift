//
//  MockService.swift
//  ColorKit
//
//  Created by Руслан Ахмадеев on 07.03.2021.
//

import UIKit

class MockService {}

extension MockService: PhotoRepository {
    func obtainStoredPhotos(completion: @escaping ([UIImage]) -> Void) {
        completion([])
    }
}
