//
//  TransactionJSONRepo.swift
//  Transaction List
//
//  Created by Gil Hakemi on 12/03/2020.
//  Copyright © 2020 Gil Hakemi. All rights reserved.
//

import Foundation

class TransactionJSONRepo {
    let networkClient: NetworkClient
    let transactionURL = "http://www.mocky.io/v2/5b36325b340000f60cf88903"
    var completion: (([Transaction]?) -> Void)!
    
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
}

extension TransactionJSONRepo: TransactionRepo {
    
    func getLatestTransactions(completion: @escaping ([Transaction]?) -> Void) {
        self.completion = completion
        
        guard let url = URL(string: transactionURL) else {
            completion(nil)
            return
        }
        
        networkClient.retrieve(from: url, completion: transactionRetrievalSuccess)
    }
    
}

extension TransactionJSONRepo {
    
    func transactionRetrievalSuccess(data: Data?) {
        guard
            let responseData = data,
            let transactionResponse = try? JSONDecoder().decode(TransactionJSONResponse.self, from: responseData)
        else {
            completion(nil)
            return
        }
        
        let transactions = self.convert(transactionResponse: transactionResponse)
        completion(transactions)
    }
    
    private func convert(transactionResponse: TransactionJSONResponse) -> [Transaction] {
        var transactionList = [Transaction]()
        
        for transaction in transactionResponse.data {
            let transactionEntity = Transaction(description: transaction.description,
                                                category: transaction.category,
                                                currency: transaction.currency,
                                                value: transaction.amount.value,
                                                icon: TransactionIcon(title: transaction.product.title,
                                                                      url: transaction.product.icon))
            
            transactionList.append(transactionEntity)
        }
        
        return transactionList
    }
    
}
