//
//  ViewController.swift
//  test
//
//  Created by Isaac Khalil on 1/12/15.
//  Copyright © 2015 Boss Portal. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    let data: [AnyObject] = ["one\ntwo\nthree", "cat\ndog\nhorse", ["apple", "bannana", "carrot"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.registerNib(UINib(nibName: "tableCell", bundle: nil), forCellReuseIdentifier: "table")
        tableView.registerNib(UINib(nibName: "textCell", bundle: nil), forCellReuseIdentifier: "text")
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 50
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let data = data[indexPath.row] as? [AnyObject] {
            let cell: TableCell = tableView.dequeueReusableCellWithIdentifier("table")! as! TableCell
            cell.data = data
            cell.backgroundColor = UIColor.orangeColor()
            cell.childTableView.dataSource = cell
            return cell
        } else {
            let cell: TextCell = tableView.dequeueReusableCellWithIdentifier("text")! as! TextCell
            cell.textView.text = "\(data[indexPath.row])"
            cell.backgroundColor = UIColor.lightGrayColor()
            return cell
        }
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if let data = data[indexPath.row] as? [AnyObject] {
//            return 200
        }
        
        return UITableViewAutomaticDimension
    }
    
    
    
}