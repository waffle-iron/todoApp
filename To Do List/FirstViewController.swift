//
//  FirstViewController.swift
//  To Do List
//
//  Created by Oscar Roa on 10/15/15.
//  Copyright © 2015 Oscar Roa. All rights reserved.
//

import UIKit

var toDoList = [String]()       //  toDoList array global for both views

class FirstViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var toDoListTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //  To avoid crashes we check if there's data already saved.
        if NSUserDefaults.standardUserDefaults().objectForKey("toDoList") != nil {
         
            toDoList = NSUserDefaults.standardUserDefaults().objectForKey("toDoList") as! [String]
            
        }
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return toDoList.count
        
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = toDoList[indexPath.row]
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
        
            toDoList.removeAtIndex(indexPath.row)
        
            NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
            
            toDoListTable.reloadData()
            
        }
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        toDoListTable.reloadData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

