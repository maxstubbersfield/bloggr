//
//  CommentCell.swift
//  bloggr
//
//  Created by Max Stubbersfield on 21.09.20.
//

import UIKit

class CommentCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel! {
        didSet {
            nameLabel.font = UIFont.boldSystemFont(ofSize: 17)
            nameLabel.numberOfLines = 0
            nameLabel.textColor = .darkText
        }
    }
    
    @IBOutlet weak var emailLabel: UILabel! {
        didSet {
            emailLabel.font = UIFont.systemFont(ofSize: 14)
            emailLabel.numberOfLines = 0
            emailLabel.textColor = .darkText
        }
    }
    @IBOutlet weak var bodyLabel: UILabel! {
        didSet {
            bodyLabel.textColor = .lightText
            bodyLabel.font = UIFont.systemFont(ofSize: 14)
            bodyLabel.numberOfLines = 0
            bodyLabel.textColor = .darkText
        }
    }
    
    func setup(with comment: Comment) {
        nameLabel.text = comment.name
        emailLabel.text = comment.email
        bodyLabel.text = comment.body
    }
    
    override func prepareForReuse() {
        nameLabel.text = nil
        emailLabel.text = nil
        bodyLabel.text = nil
    }
}
