//
//  ExpansionItem.swift
//  MultiLevelExpansion
//
//  Created by Pratik Jamariya on 11/02/20.
//  Copyright © 2020 Pratik. All rights reserved.
//

import UIKit

enum ExpansionState {
    case expanded
    case collapsed
}

protocol ExpansionDelegate: class {
    func expansion(item: ExpansionItem, didChanged state: ExpansionState, at level: Int, with root: ExpansionItem?)
}

extension ExpansionDelegate {
    func expansion(item: ExpansionItem, didChanged state: ExpansionState, at level: Int, with root: ExpansionItem?) {}
}

@IBDesignable
class ExpansionItem: UIControl {
    
    weak var parent: ExpansionItem?
    weak var child: ExpansionItem?
    weak var delegate: ExpansionDelegate?
    var rootItem: ExpansionItem? {
        get {
            if self.parent == nil {
                return self
            }
            else {
                return self.parent?.rootItem
            }
        }
    }
    var level: Int = 1
    
    var expansionState: ExpansionState = .collapsed
    var title: String = "" {
        didSet {
            expansionButton.setTitle(title, for: .normal)
        }
    }
    
    lazy var expansionButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(expansionAction(_:)), for: .touchUpInside)
        button.setTitle(title, for: .normal)
        button.setTitleColor(.systemGray, for: .normal)
        return button
    }()
    
    private lazy var containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    convenience init(parent: ExpansionItem?, delegate: ExpansionDelegate?, level: Int) {
        self.init(frame: .zero)
        self.parent = parent
        self.delegate = delegate
        self.level = level
        self.commonSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonSetup()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonSetup()
    }
    
    func commonSetup() {
        self.title = "Click at level: \(level)"
        self.addSubview(self.containerStackView)
        self.containerStackView.edges(to: self)
        self.containerStackView.addArrangedSubview(self.expansionButton)
    }
    
}

extension ExpansionItem {
    
    @objc
    private func expansionAction(_ sender: UIButton) {
        if self.expansionState == .collapsed {
            let subItem = ExpansionItem(parent: self, delegate: delegate, level: level + 1)
            child = subItem
            containerStackView.addArrangedSubview(subItem)
            self.expansionState = .expanded
        }
        else {
            child?.removeFromSuperview()
            self.child = nil
            self.expansionState = .collapsed
        }
        self.delegate?.expansion(item: self, didChanged: expansionState, at: level, with: self.rootItem)
    }
    
}
