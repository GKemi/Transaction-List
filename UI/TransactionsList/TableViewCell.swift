//
//  TableViewCell.swift
//  Transaction List
//
//  Created by Work on 13/03/2020.
//  Copyright © 2020 Gil Hakemi. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var transactionDescription: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setTransaction(with transaction: TransactionViewModel) {
        self.transactionDescription.text = transaction.description
    }
}
