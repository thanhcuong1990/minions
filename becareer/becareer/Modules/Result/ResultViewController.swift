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
    
    var arrAnswer:Array<Int>?
    var arrMajor:Array<NSDictionary>?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpHomeButton()
        
        self.navigationItem.title = NSLocalizedString("result", comment: "")
        
        self.lblTitleName?.text = NSLocalizedString("name", comment: "")
        self.lblTitleEmail?.text = NSLocalizedString("email", comment: "")
        self.lblTitleSuitable?.text = NSLocalizedString("suitable", comment: "")
        
        self.lblName?.text = APP_DELEGATE.uCurrentUser?.sName
        self.lblEmail?.text = APP_DELEGATE.uCurrentUser?.sEmail
        
        self.tblMajors?.registerNib(UINib(nibName: "MajorCell", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: "MajorCell")
        self.vTitleWrap?.layer.addBottomLine(UIColor(rgba: "#e2e2e2"), width: 1)
        
        APIClient.sharedInstance.result(APP_DELEGATE.uCurrentUser!, answer: self.arrAnswer!) { (questions) -> () in
            self.arrMajor = questions
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.tblMajors?.reloadData()
            })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

//MARK:UITableViewDataSource, UITableViewDelegate
extension ResultViewController:UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        if(self.arrMajor?.count > 0){
            return self.arrMajor!.count
        }
        return 0
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(self.arrMajor?.count > 0){
            return self.arrMajor![advance(self.arrMajor!.startIndex, section)].objectForKey("careers")!.count
        }
        return 0
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.arrMajor![advance(self.arrMajor!.startIndex, section)].objectForKey("type")?.objectForKey("name") as? String
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MajorCell", forIndexPath: indexPath) as! MajorCell
        var arrCareers = self.arrMajor![advance(self.arrMajor!.startIndex, indexPath.section)].objectForKey("careers") as? Array<NSDictionary>
        cell.lblTitle?.text = arrCareers![advance(arrCareers!.startIndex, indexPath.row)].objectForKey("name") as? String
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let vcSuggestion = StoryboardManager.sharedInstance.getInitialViewController(Storyboard.Suggestion) as! SuggestionViewController
        var arrCareers = self.arrMajor![advance(self.arrMajor!.startIndex, indexPath.section)].objectForKey("careers") as? Array<NSDictionary>
        vcSuggestion.iMajorId = arrCareers![advance(arrCareers!.startIndex, indexPath.row)].objectForKey("id") as? Int
        self.navigationController?.pushViewController(vcSuggestion, animated: true)
    }
}
