//
//  MockTransactionRepo.swift
//  TransactionListTests
//
//  Created by Work on 16/03/2020.
//  Copyright © 2020 Gil Hakemi. All rights reserved.
//

import Foundation
@testable import Transaction_List

class MockTransactionRepo: TransactionRepo {
    var transactionListWasRequested = false
    
    func getLatestTransactions(completion: @escaping ([Transaction]?) -> Void) {
        transactionListWasRequested = true
    }
    
    
}
