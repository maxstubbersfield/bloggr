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
    
    init(dependencies: PostDetailViewControllerDependencies) {
        self.dependencies = dependencies
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dependencies.fetchPostDetail {  result in
            switch result {
            case .success(let postDetailed):
                print(postDetailed)
            case .failure(let error):
                // TODO: Handle error
                print(error)
            }
        }
    }
}
