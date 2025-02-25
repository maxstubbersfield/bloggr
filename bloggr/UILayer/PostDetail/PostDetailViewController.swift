//
//  PostDetailViewController.swift
//  bloggr
//
//  Created by Max Stubbersfield on 20.09.20.
//

import UIKit

protocol PostDetailViewControllerDependencies: PostDetailUseCase {
}

final class PostDetailViewController: UIViewController {
    
    private let dependencies: PostDetailViewControllerDependencies
    
    private var postDetailed: PostDetailed?
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
            tableView.registerCell(type: CommentCell.self)
        }
    }
    
    init(dependencies: PostDetailViewControllerDependencies) {
        self.dependencies = dependencies
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dependencies.fetchPostDetail { [weak self] result in
            switch result {
            case .success(let postDetailed):
                self?.postDetailed = postDetailed
                self?.setupHeaderView(for: postDetailed)
            case .failure(let error):
                self?.postDetailed = nil
                // TODO: Handle error
                print(error)
            }
            
            self?.tableView.reloadData()
        }
    }
    
    func setupHeaderView(for postDetailed: PostDetailed) {
        guard let headerView: PostDetailHeaderView = .fromNib() else {
            return // TODO: Handle error
        }
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        tableView.tableHeaderView = headerView
        
        headerView.setup(with: postDetailed)
      
        headerView.centerXAnchor.constraint(equalTo: tableView.centerXAnchor).isActive = true
        headerView.widthAnchor.constraint(equalTo: tableView.widthAnchor).isActive = true
        headerView.topAnchor.constraint(equalTo: tableView.topAnchor).isActive = true
      
        tableView.tableHeaderView?.layoutIfNeeded()
        tableView.tableHeaderView = tableView.tableHeaderView
    }
}

extension PostDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postDetailed?.comments.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let comment = postDetailed?.comments[indexPath.row], let cell = tableView.dequeueCell(withType: CommentCell.self, for: indexPath) as? CommentCell else {
            return UITableViewCell()
        }
        
        cell.setup(with: comment)
        return cell
    }
}

extension PostDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Comments"
    }
}

private extension UIView {
    class func fromNib<T: UIView>() -> T? {
        return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)?.first as? T
    }
}
