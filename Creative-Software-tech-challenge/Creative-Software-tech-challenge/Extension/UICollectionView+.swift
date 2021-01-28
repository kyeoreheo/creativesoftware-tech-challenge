//
//  UICollectionView+.swift
//  Creative-Software-tech-challenge
//
//  Created by Kyo on 1/27/21.
//
import UIKit

extension UICollectionView {
    func deselectAllItems() {
        indexPathsForSelectedItems?
            .forEach {
                deselectItem(at: $0, animated: false)
                
            }
    }
}
