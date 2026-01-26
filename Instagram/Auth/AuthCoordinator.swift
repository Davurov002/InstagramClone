//
//  AuthCoordinator.swift
//  Instagram
//
//  Created by Abduraxmon Davurov on 25/01/26.
//

import UIKit

final class AuthCoordinator: Coordinator {
    // MARK: - Public
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
        navigationController.setViewControllers([login], animated: false)
    }

    func loginSucceeded(with email: String) {
        session.logIn()
        finish()
    }

    func finish() {
        onFinish?()
    }

    private func remove(child: Coordinator) {
        childCoordinator.removeAll { $0 === child }
    }
}

