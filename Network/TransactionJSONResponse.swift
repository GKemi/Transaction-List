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
}
