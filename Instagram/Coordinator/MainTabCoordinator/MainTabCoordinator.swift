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
        
        let reelNav = UINavigationController()
        let reel = ReelsCoordinator(navigationController: reelNav)
        reel.start()
        reelNav.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(systemName: "movieclapper"),
            selectedImage:  UIImage(systemName: "movieclapper.fill")
        )
        
        let shopNav = UINavigationController()
        let shop = ShopCoordinator(navigationController: shopNav)
        shop.start()
        shopNav.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(systemName: "bag"),
            selectedImage:  UIImage(systemName: "bag.fill")
        )
        
        let profileNav = UINavigationController()
        let profile = ProfileCoordinator(navigationController: profileNav)
        profile.start()
        let image = UIImageView(image: UIImage(named: "dogSmall"))
        profileNav.tabBarItem = UITabBarItem(
            title: nil,
            image: image.image,
            selectedImage: image.image
        )
        
        childCoordinator = [home, search, reel, shop, profile]
        tabBarController.viewControllers = [homeNav, searchNav, reelNav, shopNav, profileNav]
        return tabBarController
    }
}
