//
//  TransactionListModelTests.swift
//  TransactionListTests
//
//  Created by Work on 16/03/2020.
//  Copyright © 2020 Gil Hakemi. All rights reserved.
//

import XCTest
@testable import Transaction_List

class TransactionListModelTests: XCTestCase {
    
    var repo: MockTransactionRepo!
    var transactionListModel: TransactionsRetriever!
    
    override func setUp() {
        repo = MockTransactionRepo()
        transactionListModel = TransactionsRetriever(transactionsRepo: repo)
    }

    func testTransactionListModelRetrievesListOfTransactions() {
        //given the transaction model is initialised
        
        whenTheTransactionListIsRequested()
        
        thenTheTransactionRepoShouldBeRequested()
    }
}

extension TransactionListModelTests {
    //MARK:-Given
    
    //MARK:-When
    func whenTheTransactionListIsRequested() {
        transactionListModel.getList(completion: {_ in})
    }
    
    //MARK:-Then
    func thenTheTransactionRepoShouldBeRequested() {
        XCTAssertTrue(repo.transactionListWasRequested)
    }
}
