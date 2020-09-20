//
//  PostResponse.swift
//  bloggr
//
//  Created by Max Stubbersfield on 20.09.20.
//

import Foundation

struct PostResponse: Decodable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
