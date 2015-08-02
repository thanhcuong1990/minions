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
    
    var iMajorId:Int?
    var arrUniversities:Array<NSDictionary>?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpBackButton()
        
        self.navigationItem.title = NSLocalizedString("suggestion", comment: "")
        
        self.tblUniversities?.registerNib(UINib(nibName: "UniversityCell", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: "UniversityCell")
        
        APIClient.sharedInstance.universities(APP_DELEGATE.uCurrentUser!, majorId: self.iMajorId!) { (universities) -> () in
            self.arrUniversities = universities
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.tblUniversities?.reloadData()
            })
        }
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
        if(self.arrUniversities?.count > 0){
            return self.arrUniversities!.count
        }
        return 0
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("UniversityCell", forIndexPath: indexPath) as! UniversityCell
        cell.lblName?.text = self.arrUniversities![advance(self.arrUniversities!.startIndex, indexPath.row)].objectForKey("name") as? String
        cell.lblWebsite?.text = self.arrUniversities![advance(self.arrUniversities!.startIndex, indexPath.row)].objectForKey("website") as? String
        cell.imgUniversity?.sd_setImageWithURL(NSURL(string: (self.arrUniversities![advance(self.arrUniversities!.startIndex, indexPath.row)].objectForKey("image_url") as! String)), placeholderImage: UIImage(named: "logo"))
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("ShowWebSegue", sender: tableView.cellForRowAtIndexPath(indexPath))
    }
}
