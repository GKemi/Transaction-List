//
//  TransactionsModel.swift
//  Transaction List
//
//  Created by Work on 11/03/2020.
//  Copyright © 2020 Gil Hakemi. All rights reserved.
//

import Foundation

protocol TransactionListModel {
    func getList(completion: @escaping ([Transaction]?) -> Void)
}

class TransactionsRetriever {
    let transactionsRepo: TransactionRepo
    
    init (transactionsRepo: TransactionRepo) {
        self.transactionsRepo = transactionsRepo
    }
}

extension TransactionsRetriever: TransactionListModel {
    
    func getList(completion: @escaping ([Transaction]?) -> Void) {
        transactionsRepo.getLatestTransactions(completion: completion)
    }
    
}
