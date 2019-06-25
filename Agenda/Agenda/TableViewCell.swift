//
//  TableViewCell.swift
//  Agenda
//
//  Created by DAMII on 6/05/19.
//  Copyright © 2019 Cibertec. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var labelName: UILabel!
    
    @IBOutlet weak var labelTelephone: UILabel!
    
    func initCell(contact: Contact) {
        self.labelName.text = contact.name
        self.labelTelephone.text = contact.telephone
    }
    
}
