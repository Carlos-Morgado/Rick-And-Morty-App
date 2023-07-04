//
//  RMLocation.swift
//  Rick-And-Morty-App
//
//  Created by Carlos Morgado on 3/7/23.
//

import Foundation
/// MODELS represents a data type, an object that represents some data, it could be from an API, it could just be some local object
struct RMLocation: Codable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
}

