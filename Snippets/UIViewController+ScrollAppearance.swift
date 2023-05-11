//
//  UIViewController+ScrollAppearance.swift
//  Swift Snippets
//
//  github.com/032nnxkitty
//

import UIKit

extension UIViewController {
    func setNavigationViewsScrollColor(_ color: UIColor?) {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = color
        navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.backgroundColor = color
        tabBarController?.tabBar.standardAppearance = tabBarAppearance
    }
}

