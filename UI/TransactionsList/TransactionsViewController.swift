//
//  TransactionsViewController.swift
//  Transaction List
//
//  Created by Gil Hakemi on 11/03/2020.
//  Copyright © 2020 Gil Hakemi. All rights reserved.
//

import UIKit

class TransactionsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let networkClient = RESTNetworkClient()
        let _ = TransactionJSONRepo(networkClient: networkClient).getLatestTransactions(completion: success)
    }
    
    func success(transactions: [Transaction]?) {
        if let transactions = transactions {
            for transaction in transactions {
                print(transaction.name)
            }
        }
    }
}
