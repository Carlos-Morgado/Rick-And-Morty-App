//
//  RMRequest.swift
//  Rick-And-Morty-App
//
//  Created by Carlos Morgado on 4/7/23.
//

import Foundation
/// This is going to represent a single request. is the object that represents a single API call
final class RMRequest {
    /// API constants. Base url
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    /// Desired Endpoint
    private let endpoint: RMEndpoint
    
    /// Path components (componentes de la ruta). Path components for API, if any
    private let pathComponents: [String]
    
    /// Query parameters (parámetros de consulta). Query arguments for API, if any
    private let queryParameters: [URLQueryItem]
    
    /// Constructed url for the api request in string format. Computed property
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
    /// Computed & constructed API url
    public var url: URL? {
        return URL(string: urlString)
    }
    /// Desired http method
    public let httpMethod = "GET"
    /// Construct request
    /// - Parameters:
    ///     - endpoint: target endpoint
    ///     - pathComponents: Collection of path components
    ///     - queryParameters: Collection of query parameters
    public init(
        endpoint: RMEndpoint,
        pathComponents: [String] = [],
        queryParameters: [URLQueryItem] = []
    ) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
    /// This code is a convenient initialiser that takes a URL and processes it to initialise an object based on its structure and content. The code checks if the URL meets certain conditions and then performs a string analysis to extract relevant information for the initialisation of the object.
    ///  Attempt to create request
    ///  - Parameter url: URL to parse
    convenience init?(url: URL) {
        let string = url.absoluteString
        if !string.contains(Constants.baseUrl) {
            return nil
        }
        let trimmed = string.replacingOccurrences(of: Constants.baseUrl+"/", with: "")
        if trimmed.contains("/") {
            let components = trimmed.components(separatedBy: "/")
            if !components.isEmpty {
                let endpointString = components[0]
                var pathComponents: [String] = []
                if components.count > 1 {
                    pathComponents = components
                    pathComponents.removeFirst()
                }
                if let rmEndpoint = RMEndpoint(rawValue: endpointString) {
                    self.init(endpoint: rmEndpoint, pathComponents: pathComponents)
                    return
                }
            }
        } else if trimmed.contains("?") {
            let components = trimmed.components(separatedBy: "?")
            if !components.isEmpty, components.count >= 2 {
                let endpointString = components[0]
                let queryItemsString = components[1]
                let queryItems: [URLQueryItem] = queryItemsString.components(separatedBy: "&").compactMap({
                    guard $0.contains("=") else {
                        return nil
                    }
                    let parts = $0.components(separatedBy: "=")
                    return URLQueryItem(name: parts[0], value: parts[1])
                })
                if let rmEndpoint = RMEndpoint(rawValue: endpointString) {
                    self.init(endpoint: rmEndpoint, queryParameters: queryItems)
                    return
                }
            }
        }
        return nil
    }
}


extension RMRequest {
    static let listCharacterRequests = RMRequest(endpoint: .character)
}
