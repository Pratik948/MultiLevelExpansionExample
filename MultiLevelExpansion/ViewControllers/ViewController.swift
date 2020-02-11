//
//  ViewController.swift
//  MultiLevelExpansion
//
//  Created by Pratik Jamariya on 11/02/20.
//  Copyright © 2020 Pratik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        (cell.viewWithTag(1) as? ExpansionItem)?.delegate = self
        return cell
    }
    
}


extension ViewController: ExpansionDelegate {
    
    func expansion(item: ExpansionItem, didChanged state: ExpansionState, at level: Int, with root: ExpansionItem?) {
        self.tableView?.update {
            
        }
        print("Expansion Item Changed State to \(state) at level \(level)")
        print("Root item level is \(root?.level ?? 0)")
        if let cell = root?.superview(as: UITableViewCell.self), let indexPath = self.tableView?.indexPath(for: cell) {
            print("indexPath.section: \(indexPath.section)")
            print("indexPath.row: \(indexPath.row)")
        }
    }
    
}
