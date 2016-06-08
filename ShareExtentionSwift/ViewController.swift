//
//  ViewController.swift
//  ShareExtentionSwift
//
//  Created by User on 03/06/16.
//  Copyright © 2016 user. All rights reserved.
//

import UIKit

let defaults = NSUserDefaults.standardUserDefaults()
var URLArray = [String]()

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var TableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.TableView.dataSource = self
        self.TableView.delegate = self

        if let name = defaults.stringForKey("URLArrayValue") {
            URLArray.append(name)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return URLArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        let identifier = "cell"
        let cell: URLTableViewCell! = tableView.dequeueReusableCellWithIdentifier(identifier) as? URLTableViewCell
        
        if cell == nil {
            cell.ValueLabel.text = URLArray[indexPath.row]
        }
        
        return cell
    }

}

