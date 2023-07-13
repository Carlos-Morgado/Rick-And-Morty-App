//
//  RMCharacterDetailViewViewModel.swift
//  Rick-And-Morty-App
//
//  Created by Carlos Morgado on 12/7/23.
//

import Foundation

final class RMCharacterDetailViewViewModel {
    private let character: RMCharacter
    
    init(character: RMCharacter) {
        self.character = character
    }
    
    var title: String {
        character.name.uppercased()
    }
}
