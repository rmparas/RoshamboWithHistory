//
//  HistoryViewController.swift
//  RockPaperScissors
//
//  Created by Rod Paras on 4/28/15.
//  Copyright (c) 2015 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

   var match = [RPSMatch]()
    
    @IBOutlet weak var tabView: UITableView!
    
    let rcgf: CGFloat = CGFloat(0)
    let gcgf: CGFloat = CGFloat(0.763559)
    let bcgf: CGFloat = CGFloat(0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(animated: Bool) {
        
        tabView.backgroundColor = UIColor(red: rcgf, green: gcgf, blue: bcgf, alpha: 1)
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.match.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("MatchHistoryCell") as! UITableViewCell
        
        cell.backgroundColor = UIColor(red: rcgf, green: gcgf, blue: bcgf, alpha: 1)
        //cell.backgroundColor = UIColor.blueColor()
            
        cell.textLabel?.textColor = UIColor.blackColor()
        
        let fontSpecs = UIFont (name: "Helvetica Neue", size: 15)
        cell.textLabel?.font=fontSpecs
  
        let mtch = self.match[indexPath.row]
        
        if mtch.p1.description == mtch.p2.description {
            cell.textLabel?.text = "TIE!!"
            cell.imageView?.image = UIImage(named: "itsATie")
        } else if mtch.p1.description == mtch.winner.description{
            cell.textLabel?.text = "WIN!!!"
            cell.imageView?.image = UIImage(named: "Win")
        } else {
            cell.textLabel?.text = "LOSE!!!"
            cell.imageView?.image = UIImage(named: "Lose")
        }
        
        
        cell.detailTextLabel?.font = fontSpecs
        cell.detailTextLabel?.textColor = UIColor.blackColor()
        cell.detailTextLabel?.text = mtch.p1.description + " versus " + mtch.p2.description
        
        return cell
    }
    
    @IBAction func goBack(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
