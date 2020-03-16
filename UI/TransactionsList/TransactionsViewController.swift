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
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var removeButton: UIButton!
    
    var transactionsInteractor: TransactionsInteractor?
    var tableData = [TransactionViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        removeButton.isHidden = true
        
        let rightBarButtonItem = UIBarButtonItem()
        rightBarButtonItem.title = "Edit"
        rightBarButtonItem.target = self
        rightBarButtonItem.action = #selector(editDoneButtonPressed)
        navigationItem.rightBarButtonItem = rightBarButtonItem
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsMultipleSelectionDuringEditing = true
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        tableView.separatorInset = .zero
        transactionsInteractor?.getTransactions()
    }
    
}

extension TransactionsViewController: TransactionsView {
    func show(transactions: [TransactionViewModel]) {
        self.tableData = transactions
        tableView.reloadData()
    }
}

extension TransactionsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return self.isEditing
    }
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

extension TransactionsViewController {
    @objc func editDoneButtonPressed() {
        tableView.isEditing = !tableView.isEditing
        if tableView.isEditing {
            navigationItem.rightBarButtonItem?.title = "Done"
            removeButton.isHidden = false
        } else {
            navigationItem.rightBarButtonItem?.title = "Edit"
            removeButton.isHidden = true
        }
    }
    
    @IBAction func removeButtonPressed(_ sender: Any) {
        if let selectedRows = tableView.indexPathsForSelectedRows {
            var transactionData = [TransactionViewModel]()
            
            for indexPath in selectedRows  {
                transactionData.append(tableData[indexPath.row])
            }

            for item in transactionData {
                if let index = tableData.firstIndex(of: item) {
                    tableData.remove(at: index)
                }
            }
            
            tableView.deleteRows(at: selectedRows, with: .left)
        }
    }
}
