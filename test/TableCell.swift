//
//  text.swift
//  test
//
//  Created by Isaac Khalil on 9/12/15.
//  Copyright © 2015 Boss Portal. All rights reserved.
//

import Foundation
import UIKit

class TableCell: UITableViewCell, UITableViewDataSource {
    
    var data: [AnyObject]!
    
    @IBOutlet weak var childTableView: UITableView!
    
    override func awakeFromNib() {
        childTableView.registerNib(UINib(nibName: "tableCell", bundle: nil), forCellReuseIdentifier: "table")
        childTableView.registerNib(UINib(nibName: "textCell", bundle: nil), forCellReuseIdentifier: "text")
        
        childTableView.rowHeight = UITableViewAutomaticDimension
        childTableView.estimatedRowHeight = 50

    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let data = data[indexPath.row] as? [String] {
            let cell: TableCell = tableView.dequeueReusableCellWithIdentifier("table")! as! TableCell
            cell.data = data
            cell.backgroundColor = UIColor.orangeColor()
            return cell
        } else {
            let cell: TextCell = tableView.dequeueReusableCellWithIdentifier("text")! as! TextCell
            cell.textView.text = "\(data[indexPath.row])"
            cell.backgroundColor = UIColor.lightGrayColor()
            return cell
        }
    }


}