//
//  MockTransactionView.swift
//  TransactionListTests
//
//  Created by Work on 16/03/2020.
//  Copyright © 2020 Gil Hakemi. All rights reserved.
//

import Foundation
@testable import Transaction_List

class MockTransactionView: TransactionsView {
    var showTransactionsWasCalled = false
    var transactions: [TransactionViewModel]?
    
    func show(transactions: [TransactionViewModel]) {
        showTransactionsWasCalled = true
        self.transactions = transactions
    }
}
