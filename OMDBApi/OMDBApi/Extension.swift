//
//  CustomImage.swift
//  OMDBApi
//
//  Created by DAMII on 29/05/19.
//  Copyright © 2019 Cibertec. All rights reserved.
//

import UIKit

extension UIImageView {
    func loadImage(urlString: String) {
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!, completionHandler: {
            (data, response, error) in
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
            }
        }).resume()
    }
}
