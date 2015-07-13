//
//  NavController1.swift
//  Oblako
//
//  Created by Admin on 11.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

import UIKit




final class Todo: ResponseObjectSerializable,ResponseCollectionSerializable{
    var id = Int()
    var text = String()
    var isCompleted = Bool()
    var project_id = Int()
    @objc required init?(response: NSHTTPURLResponse, representation: AnyObject) {
        self.id = representation.valueForKeyPath("id") as! Int
        self.text = representation.valueForKeyPath("text") as! String
        self.project_id = representation.valueForKeyPath("project_id") as! Int
        self.isCompleted = representation.valueForKeyPath("isCompleted") as! Bool
    }
    @objc class func collection(#response: NSHTTPURLResponse, representation: AnyObject) -> [Todo] {
        var postArray = representation as! [AnyObject]
        // using the map function we are able to instantiate Post while reusing our init? method above
        return postArray.map({ Todo(response:response, representation: $0)! })
    }}