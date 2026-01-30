//
//  MessageModel.swift
//  Instagram
//
//  Created by Abduraxmon Davurov on 30/01/26.
//

import Foundation
import UIKit

struct MessageSetInfo {
    let image: UIImage?
    let name: String
    var messages: [MessageModel]
}

struct MessageModel {
    let isMe: Bool
    let message: String?
    let image: UIImage?
    let date: Date
    let emoji: String?
}
