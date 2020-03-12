//
//  TransactionRepo.swift
//  Transaction List
//
//  Created by Gil Hakemi on 12/03/2020.
//  Copyright © 2020 Gil Hakemi. All rights reserved.
//

import Foundation

protocol TransactionRepo {
    func getLatestTransactions() -> [Transaction]?
}
