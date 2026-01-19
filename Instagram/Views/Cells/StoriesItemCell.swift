//
//  StoriesItemCell.swift
//  Instagram
//
//  Created by Abduraxmon Davurov on 19/01/26.
//

import UIKit
import SnapKit

class StoriesItemCell: UICollectionViewCell {
    //MARK: - Public method
    func configure(with info: FeedStoriesItemCellInfo) {
        print(info)
    }
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: - Private methods
private extension StoriesItemCell {
    func initialize() {
        
    }
}
