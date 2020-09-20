//
//  PostListUseCase.swift
//  bloggr
//
//  Created by Max Stubbersfield on 20.09.20.
//

import Foundation

protocol PostListUseCase {
    func fetchPosts(completion: @escaping (Result<[Post], Error>) -> Void)
}
