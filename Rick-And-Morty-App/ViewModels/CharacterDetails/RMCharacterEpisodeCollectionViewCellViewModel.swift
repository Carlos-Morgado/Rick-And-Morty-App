//
//  RMCharacterEpisodeCollectionViewCellViewModel.swift
//  Rick-And-Morty-App
//
//  Created by Carlos Morgado on 21/7/23.
//

import Foundation

final class RMCharacterEpisodeCollectionViewCellViewModel {
    private let episodeDataUrl: URL?
    
    init(episodeDataUrl: URL?) {
        self.episodeDataUrl = episodeDataUrl
    }
}
