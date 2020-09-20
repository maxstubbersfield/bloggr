//
//  CommentsProvider.swift
//  bloggr
//
//  Created by Max Stubbersfield on 20.09.20.
//

import Foundation

final class CommentsProvider {
    
    private let network: Network
    
    init(network: Network) {
        self.network = network
    }
    
    func fetchComments(for postID: Int, completion: @escaping (Result<[CommentResponse], Error>) -> Void) {
        guard let url = createEndpoint(for: postID) else {
            return // TODO: Add error handling
        }
        network.request(url) { result in
            switch result {
            case .success(let data):
                do {
                    let comments = try JSONDecoder().decode([CommentResponse].self, from: data)
                    completion(.success(comments))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}

private extension CommentsProvider {
    func createEndpoint(for postID: Int) -> URL? {
        return URL(string: "https://jsonplaceholder.typicode.com/posts/\(postID)/comments")
    }
}
