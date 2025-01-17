//
//  TransactionViewModel.swift
//  Transaction List
//
//  Created by Work on 13/03/2020.
//  Copyright © 2020 Gil Hakemi. All rights reserved.
//

import Foundation
import UIKit

struct TransactionViewModel: Equatable {
    let description: String
    let category: String
    let value: String
    let icon: String
}
