//
//  AppCoordinator.swift
//  Instagram
//
//  Created by Abduraxmon Davurov on 25/01/26.
//
import UIKit

final class AppCoordinator: Coordinator {
    //MARK: - Public
    var childCoordinator: [Coordinator] = []
    var navigationController: UINavigationController
    let session: SessionService
    let window: UIWindow
    
    init(navigationController: UINavigationController, session: SessionService, window: UIWindow) {
        self.navigationController = navigationController
        self.session = session
        self.window = window
    }
    
    func start() {
        if session.isLogedIn {
            startMainTabReplacingStack()
        } else {
            startAuth()
        }
    }
    
    func finish() {}
    //MARK: - Private methods
    private func startAuth() {
        print("Starting auth")
        let auth = AuthCoordinator(navigationController: navigationController, session: session)
        // Parent listens to child's finish signal
        auth.onFinish = { [weak self, weak auth] in
            guard let self, let auth else { return }
            self.remove(child: auth)
            self.startMainTabReplacingStack()
        }
        childCoordinator = [auth]
        auth.start()
    }
    
    private func startMainTabReplacingStack() {
        print("Replacing navigation stack with main tab")
        let mainTab = MainTabCoordinator(navigationController: navigationController, session: session)
        childCoordinator.append(mainTab)
        mainTab.start()
    }
    
    private func remove(child: Coordinator) {
        print("Removing child coordinator")
        childCoordinator.removeAll { $0 === child }
    }
}
