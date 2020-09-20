//
//  PostListCell.swift
//  bloggr
//
//  Created by Max Stubbersfield on 20.09.20.
//

import UIKit

class PostListCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
            titleLabel.numberOfLines = 0
            bodyLabel.textColor = .darkText
        }
    }
    @IBOutlet weak var bodyLabel: UILabel! {
        didSet {
            bodyLabel.textColor = .lightText
            bodyLabel.font = UIFont.systemFont(ofSize: 14)
            bodyLabel.numberOfLines = 3
        }
    }
    
    func setup(with post: Post) {
        titleLabel.text = post.title
        bodyLabel.text = post.body
    }
    
    override func prepareForReuse() {
        titleLabel.text = nil
        bodyLabel.text = nil
    }
}
