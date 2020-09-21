//
//  PostDetailHeaderView.swift
//  bloggr
//
//  Created by Max Stubbersfield on 20.09.20.
//

import UIKit

final class PostDetailHeaderView: UIView {
    @IBOutlet var userIDLabel: UILabel! {
        didSet {
            userIDLabel.font = UIFont.systemFont(ofSize: 14)
            userIDLabel.textColor = .darkText
        }
    }
    
    @IBOutlet var idLabel: UILabel! {
        didSet {
            idLabel.font = UIFont.systemFont(ofSize: 14)
            idLabel.textColor = .darkText
        }
    }
    
    @IBOutlet var titleLabel: UILabel! {
        didSet {
            titleLabel.font = UIFont.boldSystemFont(ofSize: 19)
            titleLabel.numberOfLines = 0
            titleLabel.textColor = .darkText
        }
    }
    
    @IBOutlet var bodyLabel: UILabel! {
        didSet {
            bodyLabel.font = UIFont.systemFont(ofSize: 17)
            bodyLabel.numberOfLines = 0
            bodyLabel.textColor = .darkText
        }
    }
    
    func setup(with postDetailed: PostDetailed) {
        userIDLabel.text = "\(postDetailed.post.userId)"
        idLabel.text = "\(postDetailed.post.id)"
        titleLabel.text = postDetailed.post.title
        bodyLabel.text = postDetailed.post.body
    }
}
