//
//  LogoView.swift
//  Instagram
//
//  Created by Abduraxmon Davurov on 19/01/26.
//

import SnapKit
import UIKit

class LogoView: UIView {
    //MARK: - Init
    init() {
        super.init(frame: .zero)
        initilisze()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private constrains
    private enum UIConstraint {
        static let logoWidth: CGFloat = 104
        static let logoHeight: CGFloat = 30
    }
    
    //MARK: - Private properties
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "InstragramLogo")
        return view
    }()
}

//MARK: - Private methods
private extension LogoView {
    func initilisze() {
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(UIConstraint.logoWidth)
            make.height.equalTo(UIConstraint.logoHeight)
        }
    }
}
