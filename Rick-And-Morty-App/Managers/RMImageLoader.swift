//
//  ImageLoader.swift
//  Rick-And-Morty-App
//
//  Created by Carlos Morgado on 19/7/23.
//

import Foundation


final class RMImageLoader {
    static let shared = RMImageLoader()
    
    private var imageDataChache = NSCache<NSString, NSData>()
    
    private init() {}
    /// Get image content with url
    /// - Parameters:
    ///     - url: source url
    ///     - completion: callback
    func downloadImage(_ url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        let key = url.absoluteString as NSString
        if let data = imageDataChache.object(forKey: key) {
            completion(.success(data as Data))
            return
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? URLError(.badServerResponse)))
                return
            }
            let value = data as NSData
            self?.imageDataChache.setObject(value, forKey: key)
            completion(.success(data))
        }
        task.resume()
    }
}
