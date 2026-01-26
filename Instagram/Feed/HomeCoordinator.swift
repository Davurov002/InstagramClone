//
//  HomeCoordinator.swift
//  Instagram
//
//  Created by Abduraxmon Davurov on 25/01/26.
//

import UIKit

final class HomeCoordinator: Coordinator {
    var childCoordinator: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let feed = FeedViewController()
        feed.coordinator = self
        // Root of auth flow
        navigationController.setViewControllers([feed], animated: false)
    }
    
    func finish() {}
    
    func openMessages() {
        let messages = MessageCoordinator(navigationController: navigationController)
        childCoordinator.append(messages)
        messages.start()
    }
}
