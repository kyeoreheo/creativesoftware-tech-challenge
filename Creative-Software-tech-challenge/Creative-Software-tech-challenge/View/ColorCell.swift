//
//  ColorCell.swift
//  Creative-Software-tech-challenge
//
//  Created by Kyo on 1/26/21.
//

import UIKit

class ColorCell: UICollectionViewCell {
//    public let color: UIColor?
    public func setCircle(color: UIColor, size: CGFloat) {
        layer.cornerRadius = size / 2
        backgroundColor = color
    }
}

