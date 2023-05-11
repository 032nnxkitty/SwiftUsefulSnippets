//
//  ScrollableStackView.swift
//  Swift Snippets
//
//  github.com/032nnxkitty
//

import UIKit

extension UIFont {
    func customFont(name: String, style: UIFont.TextStyle) -> UIFont {
        guard let customFont = UIFont(name: name, size: 17) else { return .preferredFont(forTextStyle: style) }
        return UIFontMetrics(forTextStyle: style).scaledFont(for: customFont)
    }
}
