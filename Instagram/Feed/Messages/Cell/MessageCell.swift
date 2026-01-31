//
//  MessageCell.swift
//  Instagram
//
//  Created by Abduraxmon Davurov on 29/01/26.
//

import Foundation
import UIKit

class MessageCell: UITableViewCell {
    //MARK: - Public method
    func configure(with info: MessageSetInfo) {
        userImage.image = info.image
        nameLabel.text = info.name
        lastMessageLabel.text = "\(info.messages.last?.message ?? "-:-") - \(info.messages.last?.date.timeAgoString() ?? "-:-")"
    }
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initilize()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Private
    private let containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let userImage: UIImageView = {
        let view = UIImageView(image: UIImage(named: "car"))
        return view
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "aaaa"
        return label
    }()
    
    private let lastMessageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.alpha = 0.6
        label.text = "Hola! - 12 min"
        return label
    }()
    
    private let photoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "camera"), for: .normal)
        button.tintColor = .black
        button.alpha = 0.6
        return button
    }()
}

private extension MessageCell {
    func initilize() {
        containerView.addSubview(userImage)
        addSubview(containerView)
        userImage.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(4)
        }
        containerView.snp.makeConstraints { make in
            make.height.width.equalTo(54)
        }
        containerView.layer.cornerRadius = 27
        containerView.clipsToBounds = true
        containerView.layer.borderColor = UIColor.black.cgColor
        containerView.layer.borderWidth = 1
        
        let nameStack = UIStackView(arrangedSubviews: [nameLabel, lastMessageLabel])
        nameStack.axis = .vertical
        nameStack.spacing = 4
        userImage.snp.makeConstraints { make in
            make.height.width.equalTo(52)
        }
        let messageStack = UIStackView(arrangedSubviews: [containerView, nameStack])
        messageStack.axis = .horizontal
        messageStack.alignment = .center
        messageStack.spacing = 16
        
        let fullStack = UIStackView(arrangedSubviews: [messageStack, photoButton])
        addSubview(fullStack)
        photoButton.snp.makeConstraints { make in
            make.width.height.equalTo(32)
        }
        fullStack.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(13)
            make.height.equalTo(60)
        }
    }
}

#Preview {
    let vc = MessageCell()
    return vc
}
