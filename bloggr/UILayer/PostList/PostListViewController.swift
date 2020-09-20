//
//  PostListViewController.swift
//  bloggr
//
//  Created by Max Stubbersfield on 20.09.20.
//

import UIKit

protocol PostListViewControllerDependencies: PostListUseCase, SetSelectedPostUseCase {
}

protocol PostListViewControllerDelegate: AnyObject {
    func postListViewControllerDidSelectPost(_ postListViewController: PostListViewController)
}

final class PostListViewController: UIViewController {
    
    private let dependencies: PostListViewControllerDependencies
    weak var delegate: PostListViewControllerDelegate?
    
    private var posts = [Post]()
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
            tableView.registerCell(type: PostListCell.self)
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
        
        guard let post = posts[safe: indexPath.row], let cell = tableView.dequeueCell(withType: PostListCell.self, for: indexPath) as? PostListCell else {
            return UITableViewCell()
        }
        
        cell.setup(with: post)
        return cell
    }
}

extension PostListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let post = posts[safe: indexPath.row] else {
            return
        }
        
        dependencies.setSelectedPost(post)
        delegate?.postListViewControllerDidSelectPost(self)
    }
}

private extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
