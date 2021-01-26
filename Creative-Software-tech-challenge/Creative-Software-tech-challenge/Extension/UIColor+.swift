//
//  UIColor+.swift
//  Creative-Software-tech-challenge
//
//  Created by Kyo on 1/26/21.
//

import UIKit

extension UIColor {
    static let gray = UIColor(hexString: "#F9FAFF")
    static let orange = UIColor(hexString: "#EE9A4D")
    static let blue = UIColor(hexString: "#4B6CDD")

    static let picker1 = UIColor(hexString: "#AC7F6D")
    static let picker2 = UIColor(hexString: "#BD8C84")
    static let picker3 = UIColor(hexString: "#CCA16E")
    static let picker4 = UIColor(hexString: "#8FA4A2")
    static let picker5 = UIColor(hexString: "#879CB3")
    static let picker6 = UIColor(hexString: "#ABA6B6")

    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    
    func rgb (_ r: CGFloat, _ g: CGFloat, _ b:CGFloat) -> UIColor {
        return UIColor(red: r / 255, green: g / 255, blue: b / 255, alpha: 1)
    }
    
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        return String(format:"#%06x", rgb)
    }
    
}
