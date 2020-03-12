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
    
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
}

extension TransactionJSONRepo: TransactionRepo {
    
    func getLatestTransactions(completion: @escaping ([Transaction]?) -> Void) {
        
        guard let url = URL(string: transactionURL) else {
            completion(nil)
            return
        }
        //maybe try using a optional function property, and simply guard against it
        //use the bang operator when declaring it to make it 'lateinit'
        networkClient.retrieve(from: url,
                               completion: { data in
            guard
                let responseData = data,
                let transactionResponse = try? JSONDecoder().decode(TransactionJSONResponse.self, from: responseData)
            else {
                return
            }
            
            let transactions = self.convert(transactionResponse: transactionResponse)
            completion(transactions)
        })
    }
    
}

extension TransactionJSONRepo {
    
    func convert(transactionResponse: TransactionJSONResponse) -> [Transaction] {
        var transactionList = [Transaction]()
        
        for transaction in transactionResponse.data {
            transactionList.append(Transaction(name: transaction.description))
        }
        
        return transactionList
    }
    
}
