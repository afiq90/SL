//
//  ViewController.swift
//  SurvivalLanguage
//
//  Created by Megasap on 3/10/15.
//  Copyright (c) 2015 Megasap. All rights reserved.
//

import UIKit
import Alamofire

var projectID:Int!
var title:String!
var name:String!
var urlString:String!

class ViewController: UIViewController {

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Alamofire.request(.GET, "http://localhost:3000/projects.json").responseJSON { (url:NSURLRequest!, response:NSHTTPURLResponse?, data:AnyObject?, error:NSError?) -> Void in
                if error == nil {
                   // println(data["id"])

                    let dataArray:NSArray = data as NSArray
                    let dataDict:NSDictionary = dataArray[1] as NSDictionary
                    println(dataDict["name"])
            
                    //self.nameLabel.text = dataDict["name"]! as String //this is working but xcode give a warning
                    
                    if let id:AnyObject = dataDict["id"] {
                        self.idLabel.text = "\(id)"
                    }
                    
                    if let name:AnyObject = dataDict["name"] {
                        self.nameLabel.text = "\(name)"
                    }
                    
                    if let title:AnyObject = dataDict["title"] {
                        self.titleLabel.text = "\(title)"
                    }
                    
                    if let url:AnyObject = dataDict["url"] {
                        self.urlLabel.text = "\(url)"
                    }
                }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

