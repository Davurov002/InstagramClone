//
//  FeedViewModel.swift
//  Instagram
//
//  Created by Abduraxmon Davurov on 23/01/26.
//

import UIKit

final class FeedViewModel {
    
    private(set) var items: [FeedItemType] = [
        .stories(
            [
                FeedStoriesItemCellInfo(
                    image: UIImage(named: "Dog")!,
                    username: "Abduraxmon",
                    isAddButtonVisible: true,
                    isNewStory: false
                ),
                FeedStoriesItemCellInfo(
                    image: UIImage(named: "Dog")!,
                    username: "User123",
                    isAddButtonVisible: false,
                    isNewStory: true
                )
            ]
        ),
        .posts(
            FeedPostItemInfo(userImage: UIImage(named: "Dog")!, username: "Ruffles", postSubtitle: "Sponsered", postImage: UIImage(named: "Main")!, numberOfLikes: 123, comment: CommentShortInfo(username: "another_dog", commentText: "Cool :)"))
        ),
        .posts(
            FeedPostItemInfo(userImage: UIImage(named: "Dog")!, username: "Ruffles", postSubtitle: "Sponsered", postImage: UIImage(named: "Main")!, numberOfLikes: 123, comment: CommentShortInfo(username: "another_dog", commentText: "Cool :)"))
        ),
        .posts(
            FeedPostItemInfo(userImage: UIImage(named: "Dog")!, username: "Ruffles", postSubtitle: "Sponsered", postImage: UIImage(named: "Main")!, numberOfLikes: 123, comment: CommentShortInfo(username: "another_dog", commentText: "Cool :)"))
        )
    ]
    
}
