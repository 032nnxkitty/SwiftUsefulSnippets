//
//  ScrollableStackView.swift
//  Swift Snippets
//
//  github.com/032nnxkitty
//

import UIKit

public class ScrollableStackView: UIScrollView {
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    
    // MARK: - Init
    init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(stackView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Life Cycle
    override func updateConstraints() {
        super.updateConstraints()
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: self.widthAnchor),
        ])
    }
}

// MARK: - Configuration
extension ScrollableStackView {
    public var spacing: CGFloat {
        get {
            return stackView.spacing
        }
        set {
            stackView.spacing = newValue
        }
    }
    
    public var distribution: UIStackView.Distribution {
        get {
            return stackView.distribution
        }
        set {
            stackView.distribution = newValue
        }
    }
    
    public var axis: NSLayoutConstraint.Axis {
        get {
            return stackView.axis
        }
        set {
            stackView.axis = newValue
        }
    }
    
    public func addArrangedSubview(_ view: UIView) {
        stackView.addArrangedSubview(view)
    }
}
