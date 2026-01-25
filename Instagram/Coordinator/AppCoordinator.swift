//
//  AppCoordinator.swift
//  Instagram
//
//  Created by Abduraxmon Davurov on 25/01/26.
//
import UIKit

final class AppCoordinator {

    let window: UIWindow
    let session: SessionService
    var childCoordinator: [Coordinator] = []

    init(window: UIWindow, session: SessionService) {
        self.window = window
        self.session = session
    }

    func start() {
        if session.isLogedIn {
            showMainTab()
        } else {
            showAuth()
        }
    }

    private func showAuth() {
        let nav = UINavigationController()
        let auth = AuthCoordinator(navigationController: nav, session: session)
        auth.onFinish = { [weak self] in
            self?.showMainTab()
        }
        childCoordinator = [auth]
        window.rootViewController = nav
        auth.start()
    }

    private func showMainTab() {
        let mainTab = MainTabCoordinator(session: session)
        
        window.rootViewController = mainTab.start()
    }
}
