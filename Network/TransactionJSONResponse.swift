//
//  TransactionModel.swift
//  Transaction List
//
//  Created by Work on 11/03/2020.
//  Copyright © 2020 Gil Hakemi. All rights reserved.
//

import Foundation

struct TransactionJSONResponse: Decodable {
    let data: [TransactionJSONModel]
}

struct TransactionJSONModel: Decodable {
    let description: String
    let category: String
    let currency: String
    let amount: TransactionAmount
    let product: TransactionProduct
}

struct TransactionAmount: Decodable {
    let value: Double
}

struct TransactionProduct: Decodable {
    let title: String
    let icon: String
}
