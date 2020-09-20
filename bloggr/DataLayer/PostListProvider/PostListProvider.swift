//
//  PostListProvider.swift
//  bloggr
//
//  Created by Max Stubbersfield on 20.09.20.
//

import Foundation

final class PostListProvider: PostListProviderProtocol {
    
    private let network: Network
    private let endpoint = "https://jsonplaceholder.typicode.com/posts"
    
    init(network: Network) {
        self.network = network
    }
    
    func fetchPostList(completion: @escaping (Result<[Post], Error>) -> Void) {
        guard let url = URL(string: endpoint) else {
            return // TODO: Add error handling
        }
        network.request(url) { result in
            switch result {
            case .success(let data):
                do {
                    let postListResponse = try JSONDecoder().decode([PostResponse].self, from: data)
                    let posts = postListResponse.map { $0.asPost }
                    completion(.success(posts))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

}
