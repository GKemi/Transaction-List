//
//  NetworkClient.swift
//  Transaction List
//
//  Created by Gil Hakemi on 12/03/2020.
//  Copyright © 2020 Gil Hakemi. All rights reserved.
//

import Foundation

protocol NetworkClient {
    func retrieve(from url: URL, completion: @escaping (Data?) -> Void)
}

class RESTNetworkClient: NetworkClient {
    
    func retrieve(from endpoint: URL, completion: @escaping (Data?) -> Void){
        
        let dataTask = URLSession.shared.dataTask(with: endpoint) { data, _, error in
            if let data = data {
                completion(data)
            } else {
                completion(nil)
            }

        }.resume()
        
    }
    
}
