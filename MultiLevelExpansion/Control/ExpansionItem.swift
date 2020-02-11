//
//  ExpansionItem.swift
//  MultiLevelExpansion
//
//  Created by Hubilo Softech  Private Limited on 11/02/20.
//  Copyright © 2020 Pratik. All rights reserved.
//

import UIKit

@IBDesignable
class ExpansionItem: UIControl {
    
    lazy var expansionButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(expansionAction(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonSetup()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonSetup()
    }
    
    func commonSetup() {
        self.addSubview(self.containerStackView)
        self.containerStackView.edges(to: self)
        self.containerStackView.addArrangedSubview(self.expansionButton)
    }
    
}

extension ExpansionItem {
    
    @objc
    func expansionAction(_ sender: UIButton) {
        
    }
    
}
