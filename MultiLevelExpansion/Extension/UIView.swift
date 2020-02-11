//
//  UIView.swift
//  MultiLevelExpansion
//
//  Created by Pratik Jamariya on 11/02/20.
//  Copyright © 2020 Pratik. All rights reserved.
//

import UIKit

extension UIView {
    /// Constrain 4 edges of `self` to specified `view`.
    func edges(to view: UIView, top: CGFloat=0, left: CGFloat=0, bottom: CGFloat=0, right: CGFloat=0) {
        NSLayoutConstraint.activate([
            self.leftAnchor.constraint(equalTo: view.leftAnchor, constant: left),
            self.rightAnchor.constraint(equalTo: view.rightAnchor, constant: right),
            self.topAnchor.constraint(equalTo: view.topAnchor, constant: top),
            self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: bottom)
            ])
    }
    
    func superview<T>(as type: T.Type) -> T? {
        if superview is T {
            return superview as? T
        }
        else if superview == nil {
            return nil
        }
        return superview?.superview(as: type)
    }
    
}
