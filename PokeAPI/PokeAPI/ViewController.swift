//
//  ViewController.swift
//  PokeAPI
//
//  Created by DAMII on 3/06/19.
//  Copyright © 2019 Cibertec. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func loadImage(urlImage: String) {

        let url = URL(string: urlImage)
        URLSession.shared.dataTask(with: url!, completionHandler: {
            (data, response, error) in
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
            }
        }).resume()
        
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var imagePokemon: UIImageView!
    var position:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadPokemon()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func loadPokemon() {
        let urlPokemon = "https://pokeapi.co/api/v2/pokemon/" + String(position!)
        
        let url = URL(string: urlPokemon)
        
        URLSession.shared.dataTask(with: url!, completionHandler: {
            (data, response, error) in
            
            do {
                let dictionary = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String: Any]
                let sprites = dictionary["sprites"] as! [String: Any]
                let urlImage = sprites["front_default"] as! String
                DispatchQueue.main.async {
                    self.imagePokemon.loadImage(urlImage: urlImage)
                }
            }
            catch let jsonError {
                print(jsonError)
            }
        }).resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

