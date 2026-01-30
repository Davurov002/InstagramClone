//
//  MessageViewModel.swift
//  Instagram
//
//  Created by Abduraxmon Davurov on 24/01/26.
//

import Foundation
import UIKit

class MessageViewModel {
    var hideTabbar = false
    let messages: [MessageSetInfo] = [
        .init(image: UIImage(named: "car"), name: "Juan", messages: [
            .init(isMe: false, message: "hello", image: UIImage(named: "car"), date: Date(), emoji: ""),
            .init(isMe: true, message: "hello", image: UIImage(named: "car"), date: Date(), emoji: ""),
            .init(isMe: true, message: "hello", image: UIImage(named: "car"), date: Date(), emoji: ""),
            .init(isMe: true, message: "hello", image: UIImage(named: "car"), date: Date(), emoji: "")
        ]),
        .init(image: UIImage(named: "car"), name: "Juan", messages: [
            .init(isMe: false, message: "hello", image: UIImage(named: "car"), date: Date(), emoji: ""),
            .init(isMe: true, message: "hello", image: UIImage(named: "car"), date: Date(), emoji: ""),
            .init(isMe: true, message: "hello", image: UIImage(named: "car"), date: Date(), emoji: ""),
            .init(isMe: true, message: "hello", image: UIImage(named: "car"), date: Date(), emoji: "")
        ]),
        .init(image: UIImage(named: "car"), name: "Juan", messages: [
            .init(isMe: false, message: "hello", image: UIImage(named: "car"), date: Date(), emoji: ""),
            .init(isMe: true, message: "hello", image: UIImage(named: "car"), date: Date(), emoji: ""),
            .init(isMe: true, message: "hello", image: UIImage(named: "car"), date: Date(), emoji: ""),
            .init(isMe: true, message: "hello", image: UIImage(named: "car"), date: Date(), emoji: "")
        ]),
        .init(image: UIImage(named: "car"), name: "Juan", messages: [
            .init(isMe: false, message: "hello", image: UIImage(named: "car"), date: Date(), emoji: ""),
            .init(isMe: true, message: "hello", image: UIImage(named: "car"), date: Date(), emoji: ""),
            .init(isMe: true, message: "hello", image: UIImage(named: "car"), date: Date(), emoji: ""),
            .init(isMe: true, message: "hello", image: UIImage(named: "car"), date: Date(), emoji: "")
        ]),
        .init(image: UIImage(named: "car"), name: "Juan", messages: [
            .init(isMe: false, message: "hello", image: UIImage(named: "car"), date: Date(), emoji: ""),
            .init(isMe: true, message: "hello", image: UIImage(named: "car"), date: Date(), emoji: ""),
            .init(isMe: true, message: "hello", image: UIImage(named: "car"), date: Date(), emoji: ""),
            .init(isMe: true, message: "hello", image: UIImage(named: "car"), date: Date(), emoji: "")
        ]),
        .init(image: UIImage(named: "car"), name: "Juan", messages: [
            .init(isMe: false, message: "hello", image: UIImage(named: "car"), date: Date(), emoji: ""),
            .init(isMe: true, message: "hello", image: UIImage(named: "car"), date: Date(), emoji: ""),
            .init(isMe: true, message: "hello", image: UIImage(named: "car"), date: Date(), emoji: ""),
            .init(isMe: true, message: "hello", image: UIImage(named: "car"), date: Date(), emoji: "")
        ]),
        .init(image: UIImage(named: "car"), name: "Juan", messages: [
            .init(isMe: false, message: "hello", image: UIImage(named: "car"), date: Date(), emoji: ""),
            .init(isMe: true, message: "hello", image: UIImage(named: "car"), date: Date(), emoji: ""),
            .init(isMe: true, message: "hello", image: UIImage(named: "car"), date: Date(), emoji: ""),
            .init(isMe: true, message: "hello", image: UIImage(named: "car"), date: Date(), emoji: "")
        ]),
        .init(image: UIImage(named: "car"), name: "Juan", messages: [
            .init(isMe: false, message: "hello", image: UIImage(named: "car"), date: Date(), emoji: ""),
            .init(isMe: true, message: "hello", image: UIImage(named: "car"), date: Date(), emoji: ""),
            .init(isMe: true, message: "hello", image: UIImage(named: "car"), date: Date(), emoji: ""),
            .init(isMe: true, message: "hello", image: UIImage(named: "car"), date: Date(), emoji: "")
        ])
    ]
}
