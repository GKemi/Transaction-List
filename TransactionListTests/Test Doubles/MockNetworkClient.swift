//
//  MockNetworkClient.swift
//  TransactionListTests
//
//  Created by Work on 16/03/2020.
//  Copyright © 2020 Gil Hakemi. All rights reserved.
//

import Foundation
@testable import Transaction_List

class MockNetworkClient: NetworkClient {
    var jsonContent = ""
    
    func retrieve(from url: URL, completion: @escaping (Data?) -> Void) {
        completion(jsonContent.data(using: .utf8))
    }
}
