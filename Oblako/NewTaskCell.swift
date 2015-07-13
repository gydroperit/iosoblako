//
//  NewTaskCell.swift
//  Oblako
//
//  Created by Admin on 11.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

import UIKit

class NewTaskCell: UITableViewCell {

    @IBOutlet weak var textField: UITextField!
    var todoName =  String()

    override func awakeFromNib() {
        super.awakeFromNib()
        //adding textfield
        //properties
        textField.layer.borderColor = Colors.gray.CGColor
        textField.layer.borderWidth = 1.0
        textField.frame = CGRectMake(10.0,10.0,10.0,10.0)
       // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
