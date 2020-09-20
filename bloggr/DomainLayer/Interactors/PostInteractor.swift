//
//  PostInteractor.swift
//  bloggr
//
//  Created by Max Stubbersfield on 20.09.20.
//

import Foundation

enum PostInteractorError: Error {
    case missingSelectedPost
}

final class PostInteractor {
    private let postListProvider: PostListProviderProtocol
    private let commentsProvider: CommentsProviderProtocol
    private var selectedPost: Post?
    
    init(postListProvider: PostListProviderProtocol, commentsProvider: CommentsProviderProtocol) {
        self.postListProvider = postListProvider
        self.commentsProvider = commentsProvider
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

extension PostInteractor: PostDetailUseCase {
    func fetchPostDetail(completion: @escaping (Result<PostDetailed, Error>) -> Void) {
        guard let post = selectedPost else {
            DispatchQueue.main.async {
                completion(.failure(PostInteractorError.missingSelectedPost))
            }
            return
        }
        
        commentsProvider.fetchComments(for: post) { result in
            switch result {
            case .success(let comments):
                let postDetailed = PostDetailed(post: post, comments: comments)
                completion(.success(postDetailed))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

