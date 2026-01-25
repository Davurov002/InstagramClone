//
//  AuthCoordinator.swift
//  Instagram
//
//  Created by Abduraxmon Davurov on 25/01/26.
//

import UIKit

final class AuthCoordinator: Coordinator {
    //MARK: - Publik
    var childCoordinator: [Coordinator] = []
    var navigationController: UINavigationController
    let session: SessionService
    
    var onFinish: (() -> Void)?
    
    init(navigationController: UINavigationController, session: SessionService) {
        self.navigationController = navigationController
        self.session = session
    }
    
    func start() {
        let login = LoginViewController()
        login.coordinator = self
        // Root of auth flow
        navigationController.setViewControllers([login], animated: false)
    }
    
    func loginSucceeded(with email: String) {
        session.logIn()
        finish() // signal parent
    }
    
    func finish() {
        onFinish?()
    }
    
    //MARK: - Private Methods
    private func remove(child: Coordinator) {
        childCoordinator.removeAll { $0 === child }
    }
}
