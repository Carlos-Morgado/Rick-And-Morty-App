//
//  CharacterListViewViewModel.swift
//  Rick-And-Morty-App
//
//  Created by Carlos Morgado on 7/7/23.
//

import Foundation

struct CharacterListViewViewModel {
    func fetchCharacters() {
        RMService.shared.execute(.listCharacterRequests, expecting: RMGetAllCharactersResponse.self) { result in
            switch result {
            case .success(let model):
                print("Total: "+String(model.info.count))
                print("Page result count: "+String(model.results.count))
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}
