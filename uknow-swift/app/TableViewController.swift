//
//  TableViewController.swift
//  uknow-swift
//
//  Created by uknow on 2018/8/13.
//  Copyright © 2018年 uknow. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var todos: [String] = []
    
    enum Section: Int {
        case input = 0, todos, max
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(addButtonPressed))
        
        ToDoStore.shared.getToDoItems { (data) in
            self.todos += data
            self.title = "TODO - (\(self.todos.count))"
            self.tableView.reloadData()
        }
        
        self.tableView.register(UINib(nibName: "TableViewInputCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    @objc func addButtonPressed(_ send: Any) {
        let inputIndexPath = IndexPath(row: 0, section: Section.input.rawValue)
        guard let inputCell = tableView.cellForRow(at: inputIndexPath) as? TableViewInputCell, let text = inputCell.textField.text else {
            return
        }
        
        todos.insert(text, at: 0)
        inputCell.textField.text = ""
        title = "TODO - (\(self.todos.count))"
        tableView.reloadData()
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return Section.max.rawValue
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = Section(rawValue: section) else {
            fatalError()
        }
        switch section {
        case .input:
            return 1
        case .todos:
            return todos.count
        case .max:
            fatalError()
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = Section(rawValue: indexPath.section) else {
            fatalError()
        }
        
        switch section {
        case .input:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewInputCell
            cell.delegate = self
            return cell
        case .todos:
            
            let cell = UITableViewCell()
            
            cell.textLabel?.text = todos[indexPath.row]
            return cell
        default:
            fatalError()
        }
    }
}

extension TableViewController: TableViewInputCellDelegate {
    @objc func inputChanged(cell: TableViewInputCell, text: String) {
        let isItemLengthEnough = text.count >= 3
        navigationItem.rightBarButtonItem?.isEnabled = isItemLengthEnough
    }
}
