//
//  TableViewCell.swift
//  Jobs
//
//  Created by Jorge Mayta Guillermo on 6/24/19.
//  Copyright © 2019 Cibertec. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelTitle: UILabel!
        
    @IBOutlet weak var imageCompanyLogo: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initCell(title: String) {
        self.labelTitle.text = title
    }

}
