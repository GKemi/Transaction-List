//
//  Transaction.swift
//  Transaction List
//
//  Created by Work on 11/03/2020.
//  Copyright © 2020 Gil Hakemi. All rights reserved.
//

import Foundation

struct Transaction {
    let description: String
    let category: String
    let currency: String
    let value: Double
    let icon: TransactionIcon
}

struct TransactionIcon {
    let title: String
    let url: String
}
