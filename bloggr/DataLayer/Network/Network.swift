//
//  Network.swift
//  bloggr
//
//  Created by Max Stubbersfield on 20.09.20.
//

import Foundation

class Network {
    private let urlSession = URLSession.shared
    
    func request(_ url: URL, completion: @escaping(Result<Data, Error>) -> Void) {
        urlSession.dataTask(with: url) { (data, _, error) in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            } else if let data = data {
                DispatchQueue.main.async {
                    completion(.success(data))
                }
            } else {
                DispatchQueue.main.async {
                    completion(.failure(NetworkError.noData))
                }
            }
        }.resume()
    }
}
