//
//  FeedPostItemInfo.swift
//  Instagram
//
//  Created by Abduraxmon Davurov on 19/01/26.
//

import UIKit

struct FeedPostItemInfo {
    let userImage: UIImage
    let username: String
    let postSubtitle: String
    let postImage: UIImage
    let numberOfLikes: Int
    let comment: CommentShortInfo?
}

struct CommentShortInfo {
    let username: String
    let commentText: String
}
