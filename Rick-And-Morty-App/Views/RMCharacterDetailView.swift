//
//  RMCharacterDetailView.swift
//  Rick-And-Morty-App
//
//  Created by Carlos Morgado on 12/7/23.
//

import UIKit
/// View for single character info
final class RMCharacterDetailView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemPurple
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
}
