//
//  RMCharacterCollectionViewCellViewModel.swift
//  Rick-And-Morty-App
//
//  Created by Carlos Morgado on 10/7/23.
//

import Foundation

final class RMCharacterCollectionViewCellViewModel: Hashable, Equatable {
    let characterName: String
    private let characterStatus: RMCharacterStatus
    private let characterImageUrl: URL?
    
    

// MARK: - Init
    
    init(characterName: String, characterStatus: RMCharacterStatus, characterImageUrl: URL?) {
        self.characterName = characterName
        self.characterStatus = characterStatus
        self.characterImageUrl = characterImageUrl
    }
    
    var characterStatusText: String {
        return "Status: \(characterStatus.text)"
    }
    
    func fetchImage(completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = characterImageUrl else {
            completion(.failure(URLError(.badURL)))
            return
        }
        
        RMImageLoader.shared.downloadImage(url, completion: completion)
    }
    
    static func == (lhs: RMCharacterCollectionViewCellViewModel, rhs: RMCharacterCollectionViewCellViewModel) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(characterName)
        hasher.combine(characterStatus)
        hasher.combine(characterImageUrl)
    }
}
