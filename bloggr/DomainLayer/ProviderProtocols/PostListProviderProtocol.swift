//
//  PostListProviderProtocol.swift
//  bloggr
//
//  Created by Max Stubbersfield on 20.09.20.
//

import Foundation

protocol PostListProviderProtocol {
    func fetchPostList(completion: @escaping (Result<[Post], Error>) -> Void)
}
