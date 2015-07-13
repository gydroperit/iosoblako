//
//  AddTodoController.swift
//  Oblako
//
//  Created by Admin on 11.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

import UIKit
import Alamofire

class AddTodoController: UIViewController, UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {

    var selected = Int(1)
    var text = String()
    //post with data
    @IBAction func AddTodo(sender: UIBarButtonItem) {
        Alamofire.request(.POST,"http://polar-everglades-9295.herokuapp.com/main?form=\(text.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLPathAllowedCharacterSet())!)&slct=\(selected+1)")
        self.dismissViewControllerAnimated( true, completion:nil  )
        
    }
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    @IBAction func textChanged(sender: UITextField) {
        text = sender.text
    }
   
    
    @IBAction func Back(sender: UIBarButtonItem) {
            self.dismissViewControllerAnimated( true, completion:nil  )
    }

    var projects = [Project]()

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if section == 0{
            return 1
        }
        else{
            return projects.count}
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        var view = UIView()
        var label = UILabel()
        
        view.backgroundColor = Colors.gray
        if section == 0{
            label.text="    Название задачи"
        }
        else
        {
            label.text="    Категория"
        }
        label.setTranslatesAutoresizingMaskIntoConstraints(false)
        let views = ["label": label,"view": view]
        label.font = UIFont(name: "OpenSans",size: 15)
        view.addSubview(label)
        var verticalLayoutContraint = NSLayoutConstraint(item: label, attribute: .CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY, multiplier: 1, constant: 0)
        view.addConstraint(verticalLayoutContraint)
        //separators
        var separator1 = UIView(frame: CGRectMake(0, 0, tableView.bounds.width,1))
        var separator2 = UIView(frame: CGRectMake(0, 50,tableView.bounds.width,1))
        separator1.backgroundColor = Colors.grayBorder
        separator2.backgroundColor = Colors.grayBorder
        view.addSubview(separator1)
        view.addSubview(separator2)
        return view
    }
    func tableView(tableView: UITableView, didHighlightRowAtIndexPath indexPath: NSIndexPath){
        selected = indexPath.row
        println(selected)
    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 45
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //reuse prototypes
        var newTask:NewTaskCell=tableView.dequeueReusableCellWithIdentifier("cell1") as! NewTaskCell
        var category:UITableViewCell=tableView.dequeueReusableCellWithIdentifier("cell2") as! UITableViewCell
        if(indexPath.section == 0){
        return newTask
        }
        category.textLabel?.text = projects[indexPath.row].title
        category.textLabel?.font = UIFont(name:"OpenSans-Light", size: 15.0)
        if(indexPath.row == 0){
tableViewOutlet.selectRowAtIndexPath(indexPath, animated: true, scrollPosition: UITableViewScrollPosition.None)
        }
        return category
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 2
    }

    override func viewDidLoad() {
        super.viewDidLoad()
 
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
