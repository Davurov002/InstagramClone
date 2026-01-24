//
//  MainTabBarController.swift
//  Instagram
//
//  Created by Abduraxmon Davurov on 23/01/26.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        initialise()
    }
    
    //MARK: - Private Methods
    let profileImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "Dog"))
        image.image = UIImage(named: "Dog")?
            .resized(to: CGSize(width: 30, height: 30))
            .withRenderingMode(.alwaysOriginal)
        return image
    }()
}

private extension MainTabBarController {
    func initialise() {
        tabBar.tintColor = .black
        
        let feedVC = FeedViewController()
        feedVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        let searchVC = UIViewController()
        searchVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "magnifyingglass"), selectedImage: UIImage(systemName: "magnifyingglass"))
        let reelVC = UIViewController()
        reelVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "video"), selectedImage: UIImage(systemName: "video.fill"))
        let shopVC = UIViewController()
        shopVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "cart"), selectedImage: UIImage(systemName: "cart.fill"))
        let profileVC = ProfileViewController()
        profileVC.tabBarItem = UITabBarItem(title: nil, image: profileImage.image, selectedImage: profileImage.image)
        
        viewControllers = [
            UINavigationController(rootViewController: feedVC),
            UINavigationController(rootViewController: searchVC),
            UINavigationController(rootViewController: reelVC),
            UINavigationController(rootViewController: shopVC),
            UINavigationController(rootViewController: profileVC)
        ]
    }
}
