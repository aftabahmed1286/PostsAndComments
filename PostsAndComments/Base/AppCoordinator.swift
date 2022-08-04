//
//  AppCoordinator.swift
//  PostsAndComments
//
//  Created by AftabAhmed on 02/08/22.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.navigationBar.prefersLargeTitles = true
    }
    
    func start() {
        let postViewController = PostViewController.instantiate()
        postViewController.appCoordinator = self
        navigationController.pushViewController(postViewController, animated: true)
    }
    
    func showComments(_ coments: [Comment]) {
        let commentsViewController = CommentViewController.instantiate()
        commentsViewController.appCoordinator = self
        commentsViewController.viewModel = CommentViewModel()
        commentsViewController.viewModel?.comments = coments
        navigationController.pushViewController(commentsViewController, animated: true)
    }
    
}
