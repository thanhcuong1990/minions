//
//  SuggestionViewController.swift
//  becareer
//
//  Created by Nguyen Phuc Loc on 8/1/15.
//  Copyright (c) 2015 Nguyen Phuc Loc. All rights reserved.
//

import UIKit

class SuggestionViewController: BaseViewController {

    @IBOutlet weak var tblUniversities: UITableView?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpBackButton()
        
        self.navigationItem.title = NSLocalizedString("suggestion", comment: "")
        
        self.tblUniversities?.registerNib(UINib(nibName: "UniversityCell", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: "UniversityCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        (segue.destinationViewController as! WebViewController).sUniversity = (sender as! UniversityCell).lblName?.text
        (segue.destinationViewController as! WebViewController).sUrl = (sender as! UniversityCell).lblWebsite?.text
    }

}

//MARK:UITableViewDataSource,UITableViewDelegate
extension SuggestionViewController:UITableViewDataSource,UITableViewDelegate{
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("UniversityCell", forIndexPath: indexPath) as! UniversityCell
        cell.lblName?.text = "University"
        cell.lblWebsite?.text = "http://vnexpress.net"
        cell.imgUniversity?.sd_setImageWithURL(NSURL(string: ""), placeholderImage: UIImage(named: "logo"))
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("ShowWebSegue", sender: tableView.cellForRowAtIndexPath(indexPath))
    }
}
