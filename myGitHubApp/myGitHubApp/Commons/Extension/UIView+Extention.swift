//
//  UIView+Extention.swift
//  myGitHubApp
//
//  Created by Gustavo Rodrigues Leitão on 05/08/20.
//  Copyright © 2020 Gustavo. All rights reserved.
//

import UIKit
import QuartzCore

extension UIView {
    func makeACard() {
        self.backgroundColor     = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.layer.borderWidth   = 1
        self.layer.borderColor   = #colorLiteral(red: 0.7725490196, green: 0.8078431373, blue: 0.8431372549, alpha: 1)
        self.layer.cornerRadius  = 10
        self.clipsToBounds       = true
    }
    
    func anchor(top: NSLayoutYAxisAnchor? = nil, leading: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, trailing: NSLayoutXAxisAnchor? = nil, padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
        
        translatesAutoresizingMaskIntoConstraints = false
             
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
             
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
             
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
             
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
             
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
             
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    func addHeightConstaintOrUpdate(constant : CGFloat) {
        if let constraint = (self.constraints.filter({$0.identifier == "height"}).first) {
            constraint.constant = constant
            self.frame.size.height = constant
        }else {
            self.frame.size.height = constant
            let heightConstraint = heightAnchor.constraint(equalToConstant: frame.size.height)
            heightConstraint.identifier = "height"
            heightConstraint.priority   = UILayoutPriority(250)
            heightConstraint.isActive   = true
        }
        self.setNeedsLayout()
        self.invalidateIntrinsicContentSize()
    }
}
