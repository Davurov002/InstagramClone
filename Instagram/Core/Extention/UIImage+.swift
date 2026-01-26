//
//  UIImage.swift
//  Instagram
//
//  Created by Abduraxmon Davurov on 23/01/26.
//

import UIKit

extension UIImage {
    func resized(to size: CGSize) -> UIImage {
            UIGraphicsBeginImageContextWithOptions(size, false, 0)
            draw(in: CGRect(origin: .zero, size: size))
            let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return resizedImage ?? self
        }
}
