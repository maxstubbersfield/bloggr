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
                print(postDetailed)
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
        headerView.setup(with: postDetailed)
        tableView.tableHeaderView = headerView
    }
}

extension PostDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0 // TODO: Implement
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell() // TODO: Implement
    }
}

private extension UIView {
    class func fromNib<T: UIView>() -> T? {
        return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)?.first as? T
    }
}
