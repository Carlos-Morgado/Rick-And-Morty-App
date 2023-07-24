//
//  RMCharacterInformationCollectionViewCellViewModel.swift
//  Rick-And-Morty-App
//
//  Created by Carlos Morgado on 21/7/23.
//

import Foundation

final class RMCharacterInformationCollectionViewCellViewModel {
    let value: String
    let title: String
    
    init(value: String, title: String) {
        self.value = value
        self.title = title
    }
}
