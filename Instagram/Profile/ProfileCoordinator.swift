//
//  ProfileCoordinator.swift
//  Instagram
//
//  Created by Abduraxmon Davurov on 25/01/26.
//

import UIKit

final class ProfileCoordinator: Coordinator {
    var childCoordinator: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
    }
    
    func finish() {
    }
}
