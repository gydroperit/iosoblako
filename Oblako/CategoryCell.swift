//
//  CategoryCell.swift
//  Oblako
//
//  Created by Admin on 11.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {

    var todoName =  String()
    init(name:String?, style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let asd:M13Checkbox=M13Checkbox()
        asd.flat = true;
        asd.radius = 0;
        asd.checkColor = UIColor.whiteColor()
        asd.tintColor = UIColor(red:49/255,green:130/255,blue:220/255, alpha:1)
        asd.getDefaultShape()
        asd.strokeColor = UIColor(red:200/255,green:200/255,blue:200/255, alpha:1)
        asd.strokeWidth = 1.0
        asd.checkAlignment = M13CheckboxAlignmentLeft
        todoName = name!
        asd.titleLabel.text = todoName
        asd.titleLabel.font = UIFont(name:"OpenSans-Semibold",size:15)
        asd.autoFitWidthToText()
        asd.frame = CGRectMake(20, 0, self.frame.width+20, self.frame.height)
        self.addSubview(asd)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
