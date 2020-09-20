//
//  PostInteractor.swift
//  bloggr
//
//  Created by Max Stubbersfield on 20.09.20.
//

import Foundation

class PostInteractor: PostListUseCase {

    private let postListProvider: PostListProviderProtocol
    
    init(postListProvider: PostListProviderProtocol) {
        self.postListProvider = postListProvider
    }

    func fetchPosts(completion: @escaping (Result<[Post], Error>) -> Void) {
        postListProvider.fetchPostList(completion: completion)
    }
}
