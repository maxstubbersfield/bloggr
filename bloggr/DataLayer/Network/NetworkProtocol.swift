//
//  NetworkProtocol.swift
//  bloggr
//
//  Created by Max Stubbersfield on 20.09.20.
//

import Foundation

protocol NetworkProtocol {
    func request(_ url: URL, completion: @escaping(Result<Data, Error>) -> Void)
}

enum NetworkError: Error {
    case noData
}
