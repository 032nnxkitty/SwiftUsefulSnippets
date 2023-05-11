//
//  SelfSizedTableView.swift
//  Swift Snippets
//
//  github.com/032nnxkitty
//

import UIKit

class SelfSizedTableView: UITableView {
    override var contentSize:CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
}



