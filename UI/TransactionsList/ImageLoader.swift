//
//  ImageLoader.swift
//  Transaction List
//
//  Created by Work on 16/03/2020.
//  Copyright © 2020 Gil Hakemi. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func load(url: String) {
        guard let imageUrl = URL(string: url) else { return }
        
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: imageUrl) {
                if let fetchedImage = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = fetchedImage
                    }
                }
            }
        }
    }
}
