//
//  ResultViewController.swift
//  becareer
//
//  Created by Nguyen Phuc Loc on 8/1/15.
//  Copyright (c) 2015 Nguyen Phuc Loc. All rights reserved.
//

import UIKit

class ResultViewController: BaseViewController {

    @IBOutlet weak var lblTitleName: UILabel?
    @IBOutlet weak var lblTitleEmail: UILabel?
    @IBOutlet weak var lblTitleSuitable: UILabel?
    @IBOutlet weak var lblName: UILabel?
    @IBOutlet weak var lblEmail: UILabel?
    @IBOutlet weak var tblMajors: UITableView?
    @IBOutlet weak var vTitleWrap: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.hidesBackButton = true
        self.navigationItem.title = NSLocalizedString("result", comment: "")
        
        self.lblTitleName?.text = NSLocalizedString("name", comment: "")
        self.lblTitleEmail?.text = NSLocalizedString("email", comment: "")
        self.lblTitleSuitable?.text = NSLocalizedString("suitable", comment: "")
        
        self.lblName?.text = APP_DELEGATE.uCurrentUser?.sName
        self.lblEmail?.text = APP_DELEGATE.uCurrentUser?.sEmail
        
        self.tblMajors?.registerNib(UINib(nibName: "MajorCell", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: "MajorCell")
        self.vTitleWrap?.layer.addBottomLine(UIColor(rgba: "#9EE63D"), width: 2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

//MARK:UITableViewDataSource, UITableViewDelegate
extension ResultViewController:UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MajorCell", forIndexPath: indexPath) as! MajorCell
        cell.lblTitle?.text = "Major"
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let vcSuggestion = StoryboardManager.sharedInstance.getInitialViewController(Storyboard.Suggestion) as! SuggestionViewController
        self.navigationController?.pushViewController(vcSuggestion, animated: true)
    }
}
