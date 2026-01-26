//
//  MessageCoordinator.swift
//  Instagram
//
//  Created by Abduraxmon Davurov on 26/01/26.
//

import UIKit

class MessageCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let messagesVC = MessagesViewController()
        messagesVC.coordinator = self
        navigationController.pushViewController(messagesVC, animated: true)
    }
    
    func finish() {
        navigationController.popViewController(animated: true)
    }
}
