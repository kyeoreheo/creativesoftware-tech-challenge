//
//  UIFont+.swift
//  Creative-Software-tech-challenge
//
//  Created by Kyo on 1/26/21.
//

import UIKit

extension UIFont {
    func notoReg(size: CGFloat) -> UIFont {
        guard let font =  UIFont(name: "NotoSansCJKkr-Regular", size: size)
        else { return UIFont.systemFont(ofSize: size) }
        return font
    }
    
    func notoBold(size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "NotoSansCJKkr-Bold", size: size)
        else { return UIFont.boldSystemFont(ofSize: size)}
        return font
    }
}
