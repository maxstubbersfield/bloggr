//
//  CommentsProvider.swift
//  bloggr
//
//  Created by Max Stubbersfield on 20.09.20.
//

import Foundation

final class CommentsProvider: CommentsProviderProtocol {
    
    private let network: Network
    
    init(network: Network) {
        self.network = network
    }
    
    func fetchComments(for post: Post, completion: @escaping (Result<[Comment], Error>) -> Void) {
        guard let url = createEndpoint(for: post.id) else {
            return // TODO: Add error handling
        }
        network.request(url) { result in
            switch result {
            case .success(let data):
                do {
                    let commentsResponse = try JSONDecoder().decode([CommentResponse].self, from: data)
                    let comments = commentsResponse.map { $0.asComment }
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
