//
//  UIButton+Ext.swift
//  Swift Snippets
//
//  github.com/032nnxkitty
//

import UIKit

extension UIButton {
    // MARK: - Animation Based On Alpha
    func addAnimation() {
        addTarget(self, action: #selector(handleIn), for: [
            .touchDown,
            .touchDragInside
        ])
        
        addTarget(self, action: #selector(handleOut), for: [
            .touchDragOutside,
            .touchUpInside,
            .touchUpOutside,
            .touchDragExit,
            .touchCancel
        ])
    }
    
    @objc private func handleIn() {
        UIView.animate(withDuration: 0.15) { self.alpha = 0.55 }
    }
    
    @objc private func handleOut() {
        UIView.animate(withDuration: 0.15) { self.alpha = 1 }
    }
}
