//
//  AppCoordinator.swift
//  bloggr
//
//  Created by Max Stubbersfield on 20.09.20.
//

import UIKit

protocol AppCoordinatorDependencies: PostListViewControllerDependencies {
}

final class AppCoordinator {
    private let dependencies: AppCoordinatorDependencies
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController, dependencies: AppCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        let postListViewController = PostListViewController(dependencies: dependencies)
        postListViewController.delegate = self
        navigationController.pushViewController(postListViewController, animated: false)
    }
}

extension AppCoordinator: PostListViewControllerDelegate {
    func postListViewControllerDidSelectPost(_ postListViewController: PostListViewController) {
        // TODO: Show detail screen
    }
}
