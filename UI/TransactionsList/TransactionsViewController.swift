//
//  TransactionsViewController.swift
//  Transaction List
//
//  Created by Gil Hakemi on 11/03/2020.
//  Copyright © 2020 Gil Hakemi. All rights reserved.
//

import UIKit

protocol TransactionsView: class {
    func show(transactions: [TransactionViewModel])
}

class TransactionsViewController: UIViewController {
    var transactionsInteractor: TransactionsInteractor?
    @IBOutlet weak var tableView: UITableView!
    var tableData = [TransactionViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        transactionsInteractor?.getTransactions()
    }
}

extension TransactionsViewController: UITableViewDelegate {
    
}

extension TransactionsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        cell.setTransaction(with: tableData[indexPath.row])
        return cell
    }
}

extension TransactionsViewController: TransactionsView {
    func show(transactions: [TransactionViewModel]) {
        self.tableData = transactions
        tableView.reloadData()
    }
}
