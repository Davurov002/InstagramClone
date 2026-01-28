//
//  LogoView.swift
//  Instagram
//
//  Created by Abduraxmon Davurov on 19/01/26.
//

import SnapKit
import UIKit

class LogoView: UIView {
    //MARK: - Public property
    let logoWidth: CGFloat
    let logoHeight: CGFloat
    let islargeIcon: Bool
    //MARK: - Init
    init(logoWidth: CGFloat = 104, logoHeight: CGFloat = 30, islargeIcon: Bool = false) {
        self.logoWidth = logoWidth
        self.logoHeight = logoHeight
        self.islargeIcon = islargeIcon
        super.init(frame: .zero)
        initilisze()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private properties
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()
}

//MARK: - Private methods
private extension LogoView {
    func initilisze() {
        imageView.image = UIImage(named: islargeIcon ? "instagramLogoLarge" : "InstragramLogo")
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(logoWidth)
            make.height.equalTo(logoHeight)
        }
    }
}
