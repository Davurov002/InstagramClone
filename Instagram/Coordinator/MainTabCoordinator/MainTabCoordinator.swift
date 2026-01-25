//
//  MainCoordinator.swift
//  Instagram
//
//  Created by Abduraxmon Davurov on 25/01/26.
//

import UIKit

final class MainTabCoordinator {

    let session: SessionService
    var childCoordinator: [Coordinator] = []

    init(session: SessionService) {
        self.session = session
    }

    func start() -> UITabBarController {

        let tabBarController = MainTabBarController()

        let homeNav = UINavigationController()
        let home = HomeCoordinator(navigationController: homeNav)
        home.start()
        homeNav.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house.fill")
        )

        let searchNav = UINavigationController()
        let search = SearchCoordinator(navigationController: searchNav)
        search.start()
        searchNav.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(systemName: "magnifyingglass"),
            selectedImage: UIImage(systemName: "magnifyingglass")
        )

        // add others...

        childCoordinator = [home, search]

        tabBarController.viewControllers = [homeNav, searchNav]
        return tabBarController
    }
}
