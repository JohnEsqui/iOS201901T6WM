//
//  ViewController.swift
//  Jobs
//
//  Created by Jorge Mayta Guillermo on 6/24/19.
//  Copyright © 2019 Cibertec. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageCompanyLogo: UIImageView!
    @IBOutlet weak var labelLocation: UILabel!
    @IBOutlet weak var labelCompany: UILabel!
    @IBOutlet weak var labelType: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    
    var job:Job?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = job?.title
        self.labelLocation.text = job?.location
        self.labelCompany.text = job?.company
        self.labelType.text = job?.type
        self.labelDescription.text = job?.description?.htmlToString
        self.imageCompanyLogo.loadImage(urlString: job?.companyLogo)

        
    }


}

