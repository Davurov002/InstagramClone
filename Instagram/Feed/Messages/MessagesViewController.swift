//
//  MessagesViewController.swift
//  Instagram
//
//  Created by Abduraxmon Davurov on 21/01/26.
//

import UIKit


class MessagesViewController: UIViewController {
    
    var viewModel = MessageViewModel()
    weak var coordinator: MessageCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.hideTabbar = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewModel.hideTabbar = false
    }
    
}

private extension MessagesViewController {
    func initialize() {
        view.backgroundColor = .systemBackground
        setTabBar(hidden: viewModel.hideTabbar)
    }
    
    func setTabBar(hidden: Bool, animated: Bool = true) {
        guard let tabBar = tabBarController?.tabBar else { return }

        let height = tabBar.frame.height
        let offset = hidden ? height : height * 2

        UIView.animate(withDuration: animated ? 0.3 : 0) {
            tabBar.frame = tabBar.frame.offsetBy(dx: 0, dy: offset)
        }
    }

}
