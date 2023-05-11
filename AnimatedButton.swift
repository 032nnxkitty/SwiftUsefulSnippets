//
//  AnimatedButton.swift
//  Swift Snippets
//
//  github.com/032nnxkitty
//

import UIKit

class AnimatedButton: UIButton {
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override Methods & Properties
    override var isHighlighted: Bool {
        didSet {
            UIView.animate(
                withDuration: 0.1,
                delay: 0,
                options: [.beginFromCurrentState, .allowUserInteraction]) {
                    self.transform = self.isHighlighted ? CGAffineTransform(scaleX: 0.9, y: 0.9) : CGAffineTransform(scaleX: 1, y: 1)
                }
        }
    }
    
    // MARK: - Private Methods
    private func configureAppearance() {
        var customConfiguration = UIButton.Configuration.filled()
        <#Customization#>
        configuration = customConfiguration
    }
}
