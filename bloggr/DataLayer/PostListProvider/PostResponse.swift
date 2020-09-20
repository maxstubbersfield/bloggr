//
//  PostResponse.swift
//  bloggr
//
//  Created by Max Stubbersfield on 20.09.20.
//

import Foundation

// Essentially just a duplicate of `Post`, however it conforms to Decodable to avoid having the conformance in the Domain Layer
struct PostResponse: Decodable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

extension PostResponse {
    var asPost: Post {
        Post(userId: userId, id: id, title: title, body: body)
    }
}
