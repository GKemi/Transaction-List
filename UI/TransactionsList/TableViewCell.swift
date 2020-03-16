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
    @IBOutlet weak var transactionCategory: UILabel!
    @IBOutlet weak var transactionPrice: UILabel!
    @IBOutlet weak var transactionIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setTransaction(with transaction: TransactionViewModel) {
        self.transactionDescription.text = transaction.description
        self.transactionCategory.text = transaction.category
        self.transactionPrice.text = transaction.value
        self.transactionIcon.load(url: transaction.icon)
    }
}
