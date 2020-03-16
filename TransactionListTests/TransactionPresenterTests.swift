//
//  TransactionPresenterTests.swift
//  TransactionListTests
//
//  Created by Work on 16/03/2020.
//  Copyright © 2020 Gil Hakemi. All rights reserved.
//

import XCTest
@testable import Transaction_List

class TransactionPresenterTests: XCTestCase {
    var transactionView: MockTransactionView!
    var transactionPresenter: TransactionsListPresenter!
    
    var dummyTransactionData: [Transaction]?
    
    override func setUp() {
        transactionView = MockTransactionView()
        transactionPresenter = TransactionsListPresenter()
        transactionPresenter.transactionsView = transactionView
    }

    func testPresenterProvidesViewModelsToView_whenTransactionsAreAvailable() {
        givenTransactionDataIsAvailable()
            
        whenPresenterIsProvidedTransactionData()
        
        thenViewShouldBeToldToShowTransactions()
    }
    
    func testPresenterDoesNOTTellViewToShowTransactions_whenTransactionsAreUnavailable() {
        givenTransactionDataIsUnavailable()
        
        whenPresenterIsProvidedTransactionData()
        
        thenTheViewShouldNOTBeToldToShowTransactionData()
    }
    
    func testPresenterDisplaysCorrectGBPPriceValue() {
        givenTransactionDataIsAvailable()
        
        whenPresenterIsProvidedTransactionData()
        
        thenTheViewContainsTheFormattedPriceValue()
    }
}

extension TransactionPresenterTests {
    func givenTransactionDataIsAvailable() {
        dummyTransactionData = [Transaction(description: "",
        category: "",
        currency: "GBP",
        value: 123.8432,
        icon: TransactionIcon(title: "", url: ""))]
    }
    
    fileprivate func givenTransactionDataIsUnavailable() {
        dummyTransactionData = nil
    }
    
    private func whenPresenterIsProvidedTransactionData() {
        transactionPresenter.showTransactions(with: dummyTransactionData)
    }
    
    private func thenViewShouldBeToldToShowTransactions() {
        XCTAssertTrue(transactionView.showTransactionsWasCalled)
    }
    
    private func thenTheViewShouldNOTBeToldToShowTransactionData() {
         XCTAssertFalse(transactionView.showTransactionsWasCalled)
    }
    
    private func thenTheViewContainsTheFormattedPriceValue() {
        XCTAssertEqual(transactionView.transactions?[0].value, "£123.84")
    }
}
