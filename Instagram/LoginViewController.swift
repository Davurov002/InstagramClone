//
//  LoginViewController.swift
//  Instagram
//
//  Created by Abduraxmon Davurov on 25/01/26.
//

import UIKit

class LoginViewController: UIViewController {
    //MARK: - Public
    weak var coordinator: AuthCoordinator?
    
    var onFinish: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    //MARK: - Private propeties
    let loginButton: UIButton = {
       let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.addTarget(nil, action: #selector(login), for: .touchUpInside)
        button.backgroundColor = .systemBlue
        return button
    }()
    
    @objc private func login() {
        if let coordinator = coordinator {
            coordinator.finish()
        }
    }
    
}

private extension LoginViewController {
    func initialize() {
        title = "Login"
        view.backgroundColor = .systemBackground
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(20)
            make.trailing.leading.equalToSuperview().inset(20)
            make.size.height.equalTo(44)
        }
    }
}
