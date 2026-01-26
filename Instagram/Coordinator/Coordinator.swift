//
//  Coordinator.swift
//  Instagram
//
//  Created by Abduraxmon Davurov on 25/01/26.
//

import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController {get}
    func start()
    func finish()
}
