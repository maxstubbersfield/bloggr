//
//  PostListViewController.swift
//  bloggr
//
//  Created by Max Stubbersfield on 20.09.20.
//

import UIKit

protocol PostListViewControllerDependencies: PostListUseCase {
}

final class PostListViewController: UIViewController {
    
    private let dependencies: PostListViewControllerDependencies
    private var posts = [Post]()
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
        }
    }
    
    init(dependencies: PostListViewControllerDependencies) {
        self.dependencies = dependencies
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dependencies.fetchPosts { [weak self] result in
            switch result {
            case .success(let posts):
                self?.posts = posts
            case .failure:
                // TODO: Show error message
                self?.posts = []
            }
            
            self?.tableView.reloadData()
        }
    }
}

extension PostListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        return UITableViewCell()
    }
}
