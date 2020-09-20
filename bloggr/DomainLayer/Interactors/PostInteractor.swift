//
//  PostInteractor.swift
//  bloggr
//
//  Created by Max Stubbersfield on 20.09.20.
//

import Foundation

class PostInteractor {
    private let postListProvider: PostListProviderProtocol
    private var selectedPost: Post?
    
    init(postListProvider: PostListProviderProtocol) {
        self.postListProvider = postListProvider
    }
}

extension PostInteractor: PostListUseCase {
    func fetchPosts(completion: @escaping (Result<[Post], Error>) -> Void) {
        postListProvider.fetchPostList(completion: completion)
    }
}

extension PostInteractor: SetSelectedPostUseCase {
    func setSelectedPost(_ post: Post?) {
        selectedPost = post
    }
}

