//
//  TransactionsInteractor.swift
//  Transaction List
//
//  Created by Work on 13/03/2020.
//  Copyright © 2020 Gil Hakemi. All rights reserved.
//

import Foundation

protocol TransactionsInteractor {
    func getTransactions()
}

class TransactionsViewInteractor: TransactionsInteractor {
    let transactionsListModel: TransactionListModel
    var transactionsPresenter: TransactionsPresenter?
    
    init(transactionsListModel: TransactionListModel) {
        self.transactionsListModel = transactionsListModel
    }
    
    func getTransactions() {
        transactionsListModel.getList(completion: { transactions in
            self.transactionsPresenter?.showTransactions(with: transactions)
        })
    }
}
