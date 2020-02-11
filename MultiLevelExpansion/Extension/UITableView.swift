//
//  UITableView.swift
//  MultiLevelExpansion
//
//  Created by Pratik Jamariya on 11/02/20.
//  Copyright © 2020 Pratik. All rights reserved.
//

import UIKit

extension UITableView {

    func update(completion block:(()->Swift.Void)?) {
        CATransaction.begin()
        CATransaction.setCompletionBlock {
            block?()
        }
        self.beginUpdates()
        self.endUpdates()
        CATransaction.commit()
    }
    
}
