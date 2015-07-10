import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableViewObject: UITableView!
    
    var array: [[String]] = [["Cat1", "Dos1"],["Cat2", "Dos2"],["Cat3", "Dos3"]]
    

    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return array[section].count
    }
   
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
//    {
//        let cell:UITableViewCell=UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "mycell")
//        cell.textLabel!.text = "asdasd"
//        
//        return cell
//    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let color = UIColor(red:230/255,green:230/255,blue:230/255, alpha:1)
        var view = UIView() // The width will be the same as the cell, and the height should be set in tableView:heightForRowAtIndexPath:
        var label = UILabel()
        view.backgroundColor = color
        view.layer.borderColor = UIColor.grayColor().CGColor
        view.layer.borderWidth = 1.0
        label.text="    " + array[section][0]
        label.setTranslatesAutoresizingMaskIntoConstraints(false)
        let views = ["label": label,"view": view]
        label.font = UIFont(name: "OpenSans",size: 12)
        view.addSubview(label)
        var verticalLayoutContraint = NSLayoutConstraint(item: label, attribute: .CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY, multiplier: 1, constant: 0)
        view.addConstraint(verticalLayoutContraint)
        return view
  }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 30
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //находим cell, используя Identifier, который установили в storyboard, и возвращаем cell для текущего индекса
        
        //пока не нужно устанавливать текст, поскольку мы будем добавлять кастомный компонент - checkbox, а не UILabel, который установлен в стандартной UITableViewCell по умолчанию
        let cell:TodoCell=TodoCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "mycell")
        cell.todoName = array[indexPath.section][indexPath.row]
        let asd:M13Checkbox=M13Checkbox()
        asd.flat = true;
        asd.radius = 0;
        asd.checkColor = UIColor.blackColor()
        asd.tintColor = UIColor(red:49/255,green:130/255,blue:220/255, alpha:1)
        asd.getDefaultShape()
        asd.strokeColor = UIColor(red:200/255,green:200/255,blue:200/255, alpha:1)
        asd.strokeWidth = 1.0
        asd.checkAlignment = M13CheckboxAlignmentLeft
        let todoLabel = UILabel()
        todoLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        todoLabel.text? = "asdsad"
        asd.titleLabel = todoLabel
        cell.addSubview(asd)
        cell.addSubview(todoLabel)
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {

        return array.count
        
        
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //        self.tableViewObject.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}

