//
//  CommentsProviderProtocol.swift
//  bloggr
//
//  Created by Max Stubbersfield on 20.09.20.
//

import Foundation

protocol CommentsProviderProtocol {
    func fetchComments(for post: Post, completion: @escaping (Result<[Comment], Error>) -> Void)
}
