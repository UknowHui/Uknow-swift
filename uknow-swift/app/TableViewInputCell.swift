//
//  TableViewInputCell.swift
//  uknow-swift
//
//  Created by uknow on 2018/8/13.
//  Copyright © 2018年 uknow. All rights reserved.
//

import UIKit

protocol TableViewInputCellDelegate: class {
    func inputChanged(cell: TableViewInputCell, text: String)
}

class TableViewInputCell: UITableViewCell {
    
    weak var delegate:TableViewInputCellDelegate?
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func textFieldValueChanged(_ sender: UITextField) {
        
        delegate?.inputChanged(cell: self, text: sender.text ?? "")
    }
}
