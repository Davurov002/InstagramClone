//
//  LoginTextField.swift
//  Instagram
//
//  Created by Abduraxmon Davurov on 28/01/26.
//

import UIKit

class LoginTextField: UIView {
    //MARK: - Public
    let placeHolder: String
    
    //MARK: - Init
    init(placeHolder: String) {
        self.placeHolder = placeHolder
        super.init(frame: .zero)
        initiliaze()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Private Constants
    private enum UIConstants {
        static let cornerRadius: CGFloat = 6
        static let verticalPadding: CGFloat = 13
        static let leadingPadding: CGFloat = 18
    }
    
    //MARK: - Private
    private let textField: UITextField = {
        let textField = UITextField()
        return textField
    }()
}

private extension LoginTextField {
    func initiliaze() {
        textField.placeholder = placeHolder
        addSubview(textField)
        self.snp.makeConstraints { make in
            make.height.equalTo(42)
        }
        textField.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(UIConstants.verticalPadding)
            make.leading.equalToSuperview().inset(UIConstants.leadingPadding)
        }
        self.backgroundColor = UIColor(red: 232/255, green: 230/255, blue: 230/255, alpha: 0.5)
        self.layer.cornerRadius = UIConstants.cornerRadius
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor(red: 224/255, green: 221/255, blue: 221/255, alpha: 1).cgColor
    }
}

#Preview {
    let vc = LoginTextField(placeHolder: "phone number,username, or email")
    return vc
}
