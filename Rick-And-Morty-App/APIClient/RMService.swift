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
    
    enum RMServiceError : Error {
        case failedToCreateRequest
        case failedToGetData
    }
    /// Send Rick and Morty API Call
    /// - Parameters:
    ///     - request: Request instance
    ///     - type: The type of object we expect to get back
    ///     - completion: Callback with data or error
    public func execute<T: Codable>(_ request: RMRequest, expecting type: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(RMServiceError.failedToCreateRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, requestError in
//            guard let data, error == nil else {
//                completion(.failure(error ?? RMServiceError.failedToGetData))
//                return
//            }
            if let requestError {
                completion(.failure(requestError))
            }
            guard let data else {
                completion(.failure(RMServiceError.failedToGetData))
                return
            }
            // Decode response
            do {
                let jsonResult = try JSONDecoder().decode(type.self, from: data)
                completion(.success(jsonResult))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    private func request(from rmRequest: RMRequest) -> URLRequest? {
        guard let url = rmRequest.url else {return nil}
        var request = URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethod
        
        return request
    }
}
