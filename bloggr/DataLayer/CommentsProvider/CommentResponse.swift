//
//  CommentResponse.swift
//  bloggr
//
//  Created by Max Stubbersfield on 20.09.20.
//

import Foundation

struct CommentResponse: Decodable {
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String
}

extension CommentResponse {
    var asComment: Comment {
        Comment(postId: postId, id: id, name: name, email: email, body: body)
    }
}
