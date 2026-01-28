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
    //MARK: - Private Constants
    private enum UIConstant {
        static let logoWidth: CGFloat = 194
        static let logoHeight: CGFloat = 50
        static let logoToViewInset: CGFloat = 50
        static let loginButtonToTopLogoInsert: CGFloat = 65
        static let loginButtonHeight: CGFloat = 36
        static let horizontalInsert: CGFloat = 42
        static let lineViewHeight: CGFloat = 1
        static let lineViewWidth: CGFloat = 120
        static let lineStackHeight: CGFloat = 18
        static let lineStackToLoginButtonOffset: CGFloat = 44
        static let lineLabelFontSize: CGFloat = 15
        static let loginLabelFontSize: CGFloat = 18
        static let contentCorneraRadius: CGFloat = 8
        static let textFieldStackTopPadding: CGFloat = 40
        static let textFieldStackSpacing: CGFloat = 8
        static let forgetButtonFontSize: CGFloat = 13
        static let forgetPasswordButtonTopPadding: CGFloat = 10
        static let passwordLoginButtonTopPadding: CGFloat = 30
        static let singUpLabelFontSize: CGFloat = 15
        static let signUpStackTopPadding: CGFloat = 30
        static let signUpStackSpacing: CGFloat = 8
    }
    //MARK: - Private propeties
    private let instagramLogo: UIView = {
        let view = LogoView(
            logoWidth: UIConstant.logoWidth,
            logoHeight: UIConstant.logoHeight,
            islargeIcon: true
        )
        return view
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Continue with Facebook", for: .normal)
        button.setImage(UIImage(named: "facebookLogo"), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: UIConstant.loginLabelFontSize, weight: .medium)
        button.tintColor = .white
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = UIConstant.contentCorneraRadius
        button.addTarget(nil, action: #selector(login), for: .touchUpInside)
        return button
    }()
    
    private let passwordLoginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: UIConstant.loginLabelFontSize, weight: .medium)
        button.tintColor = .white
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = UIConstant.contentCorneraRadius
        button.addTarget(nil, action: #selector(login), for: .touchUpInside)
        return button
    }()
    
    private let leftLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        return view
    }()
    
    private let rightLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        return view
    }()
    
    private let lineLabel: UILabel = {
        let label = UILabel()
        label.text = "OR"
        label.font = UIFont.systemFont(ofSize: UIConstant.lineLabelFontSize)
        label.textColor = .systemGray4
        label.textAlignment = .center
        return label
    }()
    
    private let phoneNuberTF = LoginTextField(placeHolder: "phone number,username, or email")
    private let passwordTF = LoginTextField(placeHolder: "password")
    
    private let forgetPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Forgot password?", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: UIConstant.forgetButtonFontSize, weight: .medium)
        button.tintColor = .systemBlue
        return button
    }()
    
    private let singUpLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: UIConstant.singUpLabelFontSize, weight: .medium)
        label.textColor = UIColor(red: 174/255, green: 169/255, blue: 169/255, alpha: 1)
        label.text = "Don’t have an account?"
        return label
    }()
    
    private let singUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("sign up", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: UIConstant.singUpLabelFontSize, weight: .medium)
        button.tintColor = .systemBlue
        return button
    }()
    
    private let fromLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: UIConstant.singUpLabelFontSize, weight: .medium)
        label.textColor = UIColor(red: 174/255, green: 169/255, blue: 169/255, alpha: 1)
        label.text = "from"
        return label
    }()
    
    private let davurovLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: UIConstant.singUpLabelFontSize, weight: .regular)
        label.textColor = .black
        label.text = "DAVUROV"
        return label
    }()
    
    @objc private func login() {
        if let coordinator = coordinator {
            coordinator.finish()
        }
    }
    
}

private extension LoginViewController {
    func initialize() {
        view.backgroundColor = .systemBackground
        view.addSubview(instagramLogo)
        instagramLogo.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(UIConstant.logoToViewInset)
            make.centerX.equalToSuperview()
        }
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(instagramLogo.snp.bottom).offset(UIConstant.loginButtonToTopLogoInsert)
            make.trailing.leading.equalToSuperview().inset(UIConstant.horizontalInsert)
            make.size.height.equalTo(UIConstant.loginButtonHeight)
        }
        
        leftLineView.snp.makeConstraints { make in
            make.height.equalTo(UIConstant.lineViewHeight)
            make.width.equalTo(UIConstant.lineViewWidth)
        }
        rightLineView.snp.makeConstraints { make in
            make.height.equalTo(UIConstant.lineViewHeight)
            make.width.equalTo(UIConstant.lineViewWidth)
        }
        let lineStackView = UIStackView(arrangedSubviews: [
            leftLineView,
            lineLabel,
            rightLineView
        ])
        lineStackView.axis = .horizontal
        lineStackView.alignment = .center
        view.addSubview(lineStackView)
        lineStackView.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom)
                .offset(UIConstant.lineStackToLoginButtonOffset)
            make.leading.trailing.equalToSuperview()
                .inset(UIConstant.horizontalInsert)
            make.height.equalTo(UIConstant.lineStackHeight)
        }
        
        let textFieldStack = UIStackView(arrangedSubviews: [phoneNuberTF, passwordTF])
        textFieldStack.axis = .vertical
        textFieldStack.spacing = UIConstant.textFieldStackSpacing
        view.addSubview(textFieldStack)
        textFieldStack.snp.makeConstraints { make in
            make.top.equalTo(lineStackView.snp.bottom).offset(UIConstant.textFieldStackTopPadding)
            make.leading.trailing.equalToSuperview().inset(UIConstant.horizontalInsert)
        }
        view.addSubview(forgetPasswordButton)
        forgetPasswordButton.snp.makeConstraints { make in
            make.top.equalTo(textFieldStack.snp.bottom).offset(UIConstant.forgetPasswordButtonTopPadding)
            make.trailing.equalToSuperview().inset(UIConstant.horizontalInsert)
        }
        view.addSubview(passwordLoginButton)
        passwordLoginButton.alpha = 0.5
        passwordLoginButton.isEnabled = false
        passwordLoginButton.snp.makeConstraints { make in
            make.top.equalTo(forgetPasswordButton.snp.bottom).offset(UIConstant.passwordLoginButtonTopPadding)
            make.leading.trailing.equalToSuperview().inset(UIConstant.horizontalInsert)
        }
        let signUpStack = UIStackView(arrangedSubviews: [singUpLabel, singUpButton])
        signUpStack.spacing = UIConstant.signUpStackSpacing
        view.addSubview(signUpStack)
        signUpStack.snp.makeConstraints { make in
            make.top.equalTo(passwordLoginButton.snp.bottom).offset(UIConstant.signUpStackTopPadding)
            make.centerX.equalTo(view.snp.centerX)
        }
        let bottomStack = UIStackView(arrangedSubviews: [fromLabel, davurovLabel])
        view.addSubview(bottomStack)
        bottomStack.axis = .vertical
        bottomStack.alignment = .center
        bottomStack.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.centerX.equalTo(view.snp.centerX)
        }
    }
}

#Preview {
    return LoginViewController()
}
