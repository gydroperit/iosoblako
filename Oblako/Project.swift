//  NavController2.swift
//  Oblako
//
//  Created by Admin on 11.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

import UIKit
import Alamofire
    
final class Project: ResponseObjectSerializable,ResponseCollectionSerializable{
    let id : Int
    var title = String()
    var todos:[Todo] = [Todo]()

    @objc required init?(response: NSHTTPURLResponse, representation: AnyObject) {
        self.id = representation.valueForKeyPath("id") as! Int
        self.title = representation.valueForKeyPath("title") as! String
    }
    @objc class func collection(#response: NSHTTPURLResponse, representation: AnyObject) -> [Project] {
        var postArray = representation as! [AnyObject]
        // using the map function we are able to instantiate Post while reusing our init? method above
        return postArray.map({ Project(response:response, representation: $0)! })
    }}
