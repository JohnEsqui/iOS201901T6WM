//
//  ViewController.swift
//  OMDBApi
//
//  Created by DAMII on 27/05/19.
//  Copyright © 2019 Cibertec. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputMovie: UITextField!
    
    @IBOutlet weak var labelTitle: UILabel!
    
    @IBOutlet weak var labelYear: UILabel!
    
    @IBOutlet weak var imagePoster: UIImageView!
    
    @IBAction func searchMovie(_ sender: UIBarButtonItem) {
        
        var urlString = "https://www.omdbapi.com/?apikey=6fc43ba7&t=" + inputMovie.text!
        
        urlString = urlString.replacingOccurrences(of: " ", with: "+")
        
        let url = URL(string: urlString)
        
        URLSession.shared.dataTask(with: url!, completionHandler: {
            (data, response, error) in
            
            do {
                let dictionary = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String:Any]
                
                let title = dictionary["Title"] as! String
                let year = dictionary["Plot"] as! String
                let urlPoster = dictionary["Poster"] as! String
                
                DispatchQueue.main.async {
                    self.labelTitle.isHidden = false
                    self.labelTitle.text = title
                    self.labelYear.isHidden = false
                    self.labelYear.text = year
                    
                    self.imagePoster.loadImage(urlString: urlPoster)
                }
                
                
            }
            catch let jsonError {
                print(jsonError)
            }
        }).resume()
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    

}

