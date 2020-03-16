//
//  TransactionsPresenter.swift
//  Transaction List
//
//  Created by Work on 13/03/2020.
//  Copyright © 2020 Gil Hakemi. All rights reserved.
//

import Foundation
import UIKit

protocol TransactionsPresenter {
    func showTransactions(with transactions: [Transaction])
}

class TransactionsListPresenter: TransactionsPresenter {
    weak var transactionsView: TransactionsView?
    
    func showTransactions(with transactions: [Transaction]) {
        let transactionsViewModelList = adapt(transactions: transactions)
        
        transactionsView?.show(transactions: transactionsViewModelList)
    }
}

extension TransactionsListPresenter {
    private func adapt(transactions: [Transaction]) -> [TransactionViewModel] {
        var transactionViewModelList = [TransactionViewModel]()
        
        for transaction in transactions {
            let transactionViewModel = TransactionViewModel(description: transaction.description,
                                                            category: transaction.category,
                                                            amount: transaction.value,
                                                            icon: transaction.icon["url"] ?? "nil")
            
            transactionViewModelList.append(transactionViewModel)
        }
        
        return transactionViewModelList
    }
}

extension UIImageView {
    func load(url: String) {
        DispatchQueue.global().async { [weak self] in
            guard let imageUrl = URL(string: url) else { return }
            if let data = try? Data(contentsOf: imageUrl) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
