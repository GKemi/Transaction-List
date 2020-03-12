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
    
    func getLatestTransactions() -> [Transaction]? {
        guard let url = URL(string: transactionURL) else {
            return nil
        }
        
        networkClient.retrieve(from: url, completion: networkTaskCompletion)
        
        return nil
    }
    
}

extension TransactionJSONRepo {
    
    func networkTaskCompletion(data: Data?) {
        guard
            let data = data,
            let transactionResponse = try? JSONDecoder().decode(TransactionJSONResponse.self, from: data)
        else {
            return
        }
        
        for transaction in transactionResponse.data {
            print(transaction.description)
        }
    }
    
}
