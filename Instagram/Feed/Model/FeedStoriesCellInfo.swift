//
//  FeedStoriesCellInfo.swift
//  Instagram
//
//  Created by Abduraxmon Davurov on 19/01/26.
//

import UIKit

struct FeedStoriesItemCellInfo {
    let image: UIImage
    let username: String
    let isAddButtonVisible: Bool
    let isNewStory: Bool
}

typealias FeedStoriesCellInfo = [FeedStoriesItemCellInfo]
