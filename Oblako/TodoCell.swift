//
//  TodoCell.swift
//  Oblako
//
//  Created by Admin on 10.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

import UIKit
import Alamofire


class TodoCell: UITableViewCell, M13CheckboxDelegate {

    var todoName =  String()
    var id = Int()
    let asd:M13Checkbox=M13Checkbox()
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    init(name: String,style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        todoName = name
    }
    func setName(name:String, cellId: Int){
        todoName = name
        id = cellId
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        //checkbox
        let asd:M13Checkbox=M13Checkbox()
        asd.flat = true;
        asd.radius = 0;
        asd.checkColor = UIColor.whiteColor()
        asd.tintColor = Colors.theme
        asd.strokeColor = Colors.grayBorder
        asd.strokeWidth = 1.0
        asd.checkAlignment = M13CheckboxAlignmentLeft
        asd.titleLabel.font = UIFont(name:"OpenSans",size:15)
        asd.autoFitWidthToText()
        //self.bounds frame layer didn't work properly - always were null!!!
        asd.delegate = self
        asd.frame = CGRectMake(20, 0,1000,45)
        self.addSubview(asd)
        
    }
    func m13CheckboxStateChangeTo(state: M13CheckboxState) {
        //update information on server
        Alamofire.request(.PUT,"http://polar-everglades-9295.herokuapp.com/main/" + String(self.id))
        changeStriked(state.value == M13CheckboxStateChecked.value)
        println(String(self.id))
    }
    func changeStriked(value: Bool){
        let titleFont = UIFont(name: "OpenSans-Light", size:15.0)
        var attributedString = NSAttributedString(string: todoName, attributes: [NSFontAttributeName : titleFont!, NSStrikethroughStyleAttributeName : (value ? NSUnderlineStyle.StyleSingle.rawValue : NSUnderlineStyle.StyleNone.rawValue)])
        (self.subviews.last as! M13Checkbox).titleLabel.attributedText = attributedString
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
