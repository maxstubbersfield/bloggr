//
//  PostDetailHeaderView.swift
//  bloggr
//
//  Created by Max Stubbersfield on 20.09.20.
//

import UIKit

final class PostDetailHeaderView: UIView {
    @IBOutlet var userIDLabel: UILabel!
    @IBOutlet var idLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var bodyLabel: UILabel!
    
    func setup(with postDetailed: PostDetailed) {
        userIDLabel.text = "\(postDetailed.post.userId)"
        idLabel.text = "\(postDetailed.post.id)"
        titleLabel.text = postDetailed.post.title
        bodyLabel.text = postDetailed.post.body
    }
}
