//
//  AppDependencies.swift
//  bloggr
//
//  Created by Max Stubbersfield on 20.09.20.
//

import Foundation

final class AppDependencies: AppCoordinatorDependencies {
    static let shared = AppDependencies()
    
    let network = Network()
    lazy var postListProvider: PostListProviderProtocol = PostListProvider(network: network)
    
    lazy var postInteractor = PostInteractor(postListProvider: postListProvider)
}

extension AppDependencies: PostListUseCase {
    func fetchPosts(completion: @escaping (Result<[Post], Error>) -> Void) {
        postInteractor.fetchPosts(completion: completion)
    }
}

extension AppDependencies: SetSelectedPostUseCase {
    func setSelectedPost(_ post: Post?) {
        postInteractor.setSelectedPost(post)
    }
}
