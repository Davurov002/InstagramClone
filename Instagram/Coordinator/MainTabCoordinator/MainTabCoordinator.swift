//
//  MainCoordinator.swift
//  Instagram
//
//  Created by Abduraxmon Davurov on 25/01/26.
//

import UIKit

final class MainTabCoordinator: Coordinator {
    var childCoordinator: [Coordinator] = []
    let navigationController: UINavigationController
    let session: SessionService
    
    init(navigationController: UINavigationController, session: SessionService) {
        self.navigationController = navigationController
        self.session = session
    }
    
    func start() {
        // Build each tab with its own nav + coordinator
        let homeNav = UINavigationController()
        let home = HomeCoordinator(navigationController: homeNav)
        childCoordinator.append(home)
        home.start()
        
        let searchNav = UINavigationController()
        let search = SearchCoordinator(navigationController: searchNav)
        childCoordinator.append(search)
        search.start()
        
        let reelNav = UINavigationController()
        let reel = ReelsCoordinator(navigationController: reelNav)
        childCoordinator.append(reel)
        reel.start()
        
        let cartNav = UINavigationController()
        let cart = CartCoordinator(navigationController: cartNav)
        childCoordinator.append(cart)
        cart.start()
        
        let profileNav = UINavigationController()
        let profile = ProfileCoordinator(navigationController: profileNav)
        childCoordinator.append(profile)
        profile.start()
        
        navigationController.setViewControllers( [MainTabBarController()], animated: false)
    }
    
    func finish() {
    }
    
}
