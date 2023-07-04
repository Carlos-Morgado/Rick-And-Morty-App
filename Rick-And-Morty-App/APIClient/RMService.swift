//
//  RMService.swift
//  Rick-And-Morty-App
//
//  Created by Carlos Morgado on 4/7/23.
//

import Foundation
/// Will essentially be responsible for actually making API calls.
/// Primary API object to get R&M data
final class RMService {
    /// Shared singleton instance
    static let shared = RMService()
    /// Privatized constructor
    private init() {}
    /// Send Rick and Morty API Call
    /// - Parameters:
    ///     - request: Request instance
    ///     - completion: Callback with data or error
    public func execute(_request: RMRequest , completion: @escaping (Int) -> Void) {
        // Aquí lanzamos la request
        
    }
}
