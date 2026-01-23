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
        feedVC.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        let profileVC = ProfileViewController()
        profileVC.tabBarItem = UITabBarItem(title: nil, image: profileImage.image, selectedImage: profileImage.image)
        
        viewControllers = [
            UINavigationController(rootViewController: feedVC),
            UINavigationController(rootViewController: profileVC),
        ]
    }
}
