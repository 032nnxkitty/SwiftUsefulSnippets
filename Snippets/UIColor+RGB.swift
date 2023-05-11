//
//  UIColor+RGB.swift
//  Swift Snippets
//
//  github.com/032nnxkitty
//

import UIKit.UIColor

extension UIColor {
    class func RGBColor(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}
