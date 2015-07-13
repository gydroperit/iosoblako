import UIKit
import Alamofire

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var thdr: UINavigationItem!
    
    @IBOutlet weak var tableViewObject: UITableView!
    //projects array
    var projects = [Project]()
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return projects[section].todos.count
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
                var view = UIView()
        var label = myUILabel()
        
        view.backgroundColor = Colors.gray
        label.text=projects[section].title.uppercaseString
        label.frame = CGRectMake(0, 0, self.view.bounds.width,50)
        let views = ["label": label,"view": view]
        label.font = UIFont(name: "OpenSans-Semibold",size: 12)
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
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 45
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //находим cell, используя Identifier, который установили в storyboard, и возвращаем cell для текущего индекса
        //пока не нужно устанавливать текст, поскольку мы будем добавлять кастомный компонент - checkbox, а не UILabel, который установлен в стандартной UITableViewCell по умолчанию
        var cell:TodoCell=tableView.dequeueReusableCellWithIdentifier("reuseCell") as! TodoCell
        cell.setName(projects[indexPath.section].todos[indexPath.row].text, cellId: projects[indexPath.section].todos[indexPath.row].id)
        cell.changeStriked(projects[indexPath.section].todos[indexPath.row].isCompleted)
        if( projects[indexPath.section].todos[indexPath.row].isCompleted ){
         //setCheckState не работает
            if(cell.subviews.last?.checkState.value !=  M13CheckboxStateChecked.value){
                cell.subviews.last?.toggleCheckState()
            }
        }
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return projects.count
    }
    
    override func viewDidLoad()
    {
        
        super.viewDidLoad()
        self.loadData()
        let titleView = UILabel()
        titleView.text = "Задачи"
        titleView.font = UIFont(name: "OpenSans", size:21.0)
        thdr.titleView?.addSubview(titleView)
        self.tableViewObject.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(Bool())
        self.loadData()
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "AddTodoSegue"){
            let vController:UINavigationController = segue.destinationViewController as! UINavigationController
            let endController:AddTodoController = vController.childViewControllers[0] as! AddTodoController
            endController.projects = self.projects
        }
        
        }
    func loadData(){
        Alamofire.request(.GET,"http://polar-everglades-9295.herokuapp.com/project/index.json")
            .responseCollection { (_, _, proj: [Project]?, error) in
            self.projects = proj!
                  for cur in self.projects{
            Alamofire.request(.GET,"http://polar-everglades-9295.herokuapp.com/todo/index.json?id=" + String(cur.id))
            .responseCollection { (_, _, todo: [Todo]?, error) in
                cur.todos = todo!
                self.tableViewObject.reloadData()

                    }
                }

        }

    }
}

