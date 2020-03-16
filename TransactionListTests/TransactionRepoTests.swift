//
//  TransactionRepoTests.swift
//  TransactionListTests
//
//  Created by Work on 16/03/2020.
//  Copyright © 2020 Gil Hakemi. All rights reserved.
//

import XCTest
@testable import Transaction_List

class TransactionRepoTests: XCTestCase {
    var networkClient: MockNetworkClient!
    var transactionRepo: TransactionJSONRepo!
    var transactionData: [Transaction]?

    override func setUp() {
        networkClient = MockNetworkClient()
        transactionRepo = TransactionJSONRepo(networkClient: networkClient)
    }

    func testRepoIsAbleToParseValidJSON() {
        givenThereIsValidJSON()
        
        whenTransactionListIsRequestedFromRepo()
        
        thenTransactionsAreAvailable()
    }
    
    func testRepoReturnsNil_whenJSONIsMissingValues() {
        givenThereIsJSONWithMissingContent()
        
        whenTransactionListIsRequestedFromRepo()
        
        thenTransactionsAreNOTAvailable()
    }
    
    func testRepoReturnsNil_whenJSONIsInvalid() {
        givenThereIsInvalidJSON()
        
        whenTransactionListIsRequestedFromRepo()
        
        thenTransactionsAreNOTAvailable()
    }
}

extension TransactionRepoTests {
    func givenThereIsValidJSON() {
        networkClient.jsonContent = """
        {
            "data":   [{
                          "id": "13acb877dc4d8030c5dacbde33d3496a2ae3asdc000db4c793bda9c3228baca1a28",
                          "date": "2018-03-19",
                          "description": "Forbidden planet",
                          "category": "General",
                          "currency": "GBP",
                          "amount":
                          {
                            "value": 13,
                            "currency_iso": "GBP"
                          },
                          "product":
                          {
                            "id": 4279,
                            "title": "Lloyds Bank",
                            "icon": "https://storage.googleapis.com/budcraftstorage/uploads/products/lloyds-bank/Llyods_Favicon-1_161201_091641.jpg"
                          }
                    }]
        }
        """
    }
    
    func givenThereIsJSONWithMissingContent() {
        networkClient.jsonContent = """
        {
            "data":   [{
                          "id": "13acb877dc4d8030c5dacbde33d3496a2ae3asdc000db4c793bda9c3228baca1a28",
                          "date": "2018-03-19",
                          "description": "Forbidden planet",
                          "category": "General",
                          "amount":
                          {
                            "value": 13,
                            "currency_iso": "GBP"
                          },
                    }]
        }
        """
    }
    
    func givenThereIsInvalidJSON() {
        networkClient.jsonContent = """
        fsdjgsdkjfgbdklfgnjsdgnkolnfgsd
        """
    }
    
    func whenTransactionListIsRequestedFromRepo() {
        transactionRepo.getLatestTransactions(completion: {transactions in
            self.transactionData = transactions
        })
    }
    
    func thenTransactionsAreAvailable() {
        XCTAssertNotNil(transactionData)
    }
    
    func thenTransactionsAreNOTAvailable() {
        XCTAssertNil(transactionData)
    }
}
