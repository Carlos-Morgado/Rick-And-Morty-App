//
//  RMRequest.swift
//  Rick-And-Morty-App
//
//  Created by Carlos Morgado on 4/7/23.
//

import Foundation
/// This is going to represent a single request. is the object that represents a single API call
final class RMRequest {
    // Base url
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    
    // Endpoint
    private let endpoint: RMEndpoint
    
    // Path components (componentes de la ruta)
    private let pathComponents: [String]
    
    // Query parameters (parámetros de consulta)
    private let queryParameters: [URLQueryItem]
    
    /// Constructed url for the api request in string format
    private var urlString: String {
        var string = Constants.baseUrl
        string += "/"
        string += endpoint.rawValue
        
        if !pathComponents.isEmpty {
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
        if !queryParameters.isEmpty {
            string += "?"
            // name=value & name=value
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else {return nil}
                return "\($0.name)=\(value)"
            })
                .joined(separator: "&")
           string += argumentString
        }
        return string
    }
    
    public var url: URL? {
        return URL(string: urlString)
    }
    
    public init(
        endpoint: RMEndpoint,
        pathComponents: [String] = [],
        queryParameters: [URLQueryItem] = []
    ) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
}
