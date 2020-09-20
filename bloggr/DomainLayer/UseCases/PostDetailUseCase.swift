//
//  PostDetailUseCase.swift
//  bloggr
//
//  Created by Max Stubbersfield on 20.09.20.
//

import Foundation

protocol PostDetailUseCase {
    func fetchPostDetail(completion: @escaping (Result<PostDetailed, Error>) -> Void)
}
