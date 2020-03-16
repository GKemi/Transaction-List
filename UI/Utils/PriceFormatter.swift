//
//  PriceFormatter.swift
//  Transaction List
//
//  Created by Work on 16/03/2020.
//  Copyright © 2020 Gil Hakemi. All rights reserved.
//

import Foundation

class PriceFormatter {
    var currencyMap = ["GBP" : "£"]
    
    func formatPrice(with value: Double, currency: String) -> String {
        if let currencySymbol = currencyMap[currency] {
            return String(format: "\(currencySymbol)%.2f", value)
        } else {
            return "N/A"
        }
    }
}
