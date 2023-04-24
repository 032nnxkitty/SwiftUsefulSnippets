//
//  ThemeUserDefaults.swift
//  Swift Snippets
//
//  github.com/032nnxkitty
//

import UIKit

enum Theme: Int {
    case device
    case light
    case dark
}

extension Theme {
    var userInterfaceStyle: UIUserInterfaceStyle {
        switch self {
        case .device:
            return .unspecified
        case .light:
            return .light
        case .dark:
            return .dark
        }
    }
}

extension UserDefaults {
    var theme: Theme {
        get {
            let currentThemeIndex = integer(forKey: "THEME_KEY_CONST")
            return Theme(rawValue: currentThemeIndex) ?? .dark
        } set {
            set(newValue.rawValue, forKey: "THEME_KEY_CONST")
        }
    }
}
