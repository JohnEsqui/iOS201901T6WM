//
//  Extension.swift
//  Jobs
//
//  Created by DAMII on 24/06/19.
//  Copyright © 2019 Cibertec. All rights reserved.
//

import UIKit

extension UIImageView {
    func loadImage(urlString: String?) {
        
        if urlString != nil {
            let url = URL(string: urlString!)
            URLSession.shared.dataTask(with: url!, completionHandler: {
                (data, response, error) in
                DispatchQueue.main.async {
                    self.image = UIImage(data: data!)
                }
            }).resume()
        }
    }
}

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString()}
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}
