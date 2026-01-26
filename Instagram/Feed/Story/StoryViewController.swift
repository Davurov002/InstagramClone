//
//  StoryView.swift
//  Instagram
//
//  Created by Abduraxmon Davurov on 23/01/26.
//

import UIKit
import SnapKit

class StoryViewController: UIViewController {
    
    //MARK: - Public
    func configure(with story: FeedStoriesItemCellInfo) {
        userlmage.image = story.image
        usernameLabel.text = story.username
        timeLabel.text = "10h"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    let storyImage: UIImageView = {
        let view = UIImageView(image: UIImage(named: "Main"))
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    //MARK: - Private constrains
    private enum UIConstraint {
        static let progressViewInsetToView: CGFloat = 10
        static let progressViewHorizontalInsetToView: CGFloat = 8
        static let imageSize: CGFloat = 36
        static let profileStackOffsetToProgress: CGFloat = 7
        static let profileStackSpacing: CGFloat = 10
        static let fontSize: CGFloat = 12
        static let contentOffset: CGFloat = 13
        static let crossButtonInsetToProgress = 12
        static let bottomStackHeight = 40
        static let bottomStackSpacing: CGFloat = 16
        static let bottomStackInsetToView = 12
    }
    
    //MARK: - Private properties
    private let userlmage: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstraint.fontSize, weight: .medium)
        label.textColor = .white
        return label
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstraint.fontSize, weight: .light)
        label.alpha = 0.7
        return label
    }()
    
    private let progressView: UIProgressView = {
        let view = UIProgressView()
        return view
    }()
    
    private let crossButton: UIButton = {
        let button = UIButton(type: .system)
        let config = UIImage.SymbolConfiguration(pointSize: 13, weight: .bold)
        button.setImage(UIImage(systemName: "xmark", withConfiguration: config), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13, weight: .semibold)
        button.tintColor = .white
        button.addTarget(nil, action: #selector(crossButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let textFiledView: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.backgroundColor = .clear
        return view
    }()
    
    private let textField: UITextField = {
       let textField = UITextField()
        textField.placeholder = "Send message"
        textField.borderStyle = .roundedRect
        textField.layer.borderColor = UIColor.red.cgColor
        textField.backgroundColor = .clear
        return textField
    }()
    
    private let likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 13, weight: .semibold)
        return button
    }()
    
    private let sendButton: UIButton = {
       let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "paperplane"), for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 13, weight: .semibold)
        return button
    }()

    //MARK: - Private methods
    @objc func crossButtonTapped() {
        dismiss(animated: true)
    }
}

private extension StoryViewController {
    func initialize() {
        view.addSubview(storyImage)
        storyImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        view.addSubview(progressView)
        progressView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(UIConstraint.progressViewInsetToView)
            make.leading.trailing.equalToSuperview().inset(UIConstraint.progressViewHorizontalInsetToView)
        }
        let profileStackView = UIStackView()
        profileStackView.spacing = UIConstraint.profileStackSpacing
        profileStackView.axis = .horizontal
        profileStackView.addArrangedSubview(userlmage)
        profileStackView.addArrangedSubview(usernameLabel)
        profileStackView.addArrangedSubview(timeLabel)
        view.addSubview(profileStackView)
        userlmage.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: UIConstraint.imageSize, height: UIConstraint.imageSize))
        }
        profileStackView.snp.makeConstraints { make in
            make.top.equalTo(progressView.snp.bottom).offset(UIConstraint.profileStackOffsetToProgress)
            make.leading.equalToSuperview().inset(UIConstraint.contentOffset)
        }
        view.addSubview(crossButton)
        crossButton.snp.makeConstraints { make in
            make.top.equalTo(progressView.snp.bottom).offset(UIConstraint.crossButtonInsetToProgress)
            make.trailing.equalToSuperview().inset(UIConstraint.contentOffset)
        }
        textFiledView.addSubview(textField)
        textField.snp.makeConstraints { make in
            make.edges.equalTo(textFiledView).inset(1)
        }
        let buttonStack = UIStackView()
        buttonStack.addArrangedSubview(likeButton)
        buttonStack.addArrangedSubview(sendButton)
        let bottomStackView = UIStackView()
        bottomStackView.addArrangedSubview(textFiledView)
        bottomStackView.addArrangedSubview(buttonStack)
        bottomStackView.spacing = UIConstraint.bottomStackSpacing
        buttonStack.spacing = UIConstraint.bottomStackSpacing
        view.addSubview(bottomStackView)
        bottomStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(UIConstraint.bottomStackInsetToView)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.size.height.equalTo(UIConstraint.bottomStackHeight)
        }
    }
}

#Preview {
    let vc = StoryViewController()
    vc.configure(with: FeedStoriesItemCellInfo(image: UIImage(named: "Dog")!, username: "User123", isAddButtonVisible: false, isNewStory: false))
    return vc
}
