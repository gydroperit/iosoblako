//
//  Colors.swift
//  Oblako
//
//  Created by Admin on 12.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

import Foundation
import UIKit

struct Colors{
    static var gray = UIColor(red:240/255,green:240/255,blue:240/255, alpha:1)
    static var theme = UIColor(red:58/255,green:175/255,blue:219/255, alpha:1)
    static var grayBorder = UIColor(red:220/255,green:220/255,blue:220/255, alpha:1)

}

class myUILabel: UILabel{
    override func drawTextInRect(rect: CGRect) {
        let insets = UIEdgeInsets(top: 0,left: 20,bottom: 0,right: -500)
        super.drawTextInRect(UIEdgeInsetsInsetRect(rect, insets))
    }
 
}