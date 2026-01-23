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
        profileStackView.spacing = 10
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
    }
}

#Preview {
    let vc = StoryViewController()
    vc.configure(with: FeedStoriesItemCellInfo(image: UIImage(named: "Dog")!, username: "User123", isAddButtonVisible: false, isNewStory: false))
    return vc
}
