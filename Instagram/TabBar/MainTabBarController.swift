//
//  MainTabBarController.swift
//  Instagram
//
//  Created by Abduraxmon Davurov on 23/01/26.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    //MARK: - Public methods
    func configure(with viewControllers: [UIViewController]) {
        self.viewControllers = viewControllers
        tabBar.tintColor = .black
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
}

