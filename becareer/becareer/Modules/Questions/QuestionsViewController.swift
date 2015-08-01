//
//  QustionsViewController.swift
//  becareer
//
//  Created by Nguyen Phuc Loc on 8/1/15.
//  Copyright (c) 2015 Nguyen Phuc Loc. All rights reserved.
//

import UIKit

class QuestionsViewController: BaseViewController {

    @IBOutlet weak var vWrap: UIView?
    @IBOutlet weak var tvQuestion: UITextView?
    @IBOutlet weak var tbvAnswers: UITableView?
    
    var arrQuestion:Array<NSDictionary> = Array() //quenstions from server
    var arrAnswer:Array<Int> = Array() //answers request to server
    var iCurrentQuestion = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpBackButton()
        self.setUpNextButton()
        
        self.navigationItem.title = NSLocalizedString("questions", comment: "").stringByAppendingString(" \(iCurrentQuestion + 1)")
        self.tbvAnswers?.registerNib(UINib(nibName: "AnswerCell", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: "AnswerCell")
        self.tbvAnswers?.layer.addTopLine(UIColor(rgba: "#e2e2e2"), width: 1)
        
        var style = NSMutableParagraphStyle()
        style.lineSpacing = 5
        let attributes = [NSParagraphStyleAttributeName : style, NSFontAttributeName:UIFont.systemFontOfSize(15)]
        self.tvQuestion?.attributedText = NSAttributedString(string: self.tvQuestion!.text!, attributes:attributes)
        
        APIClient.sharedInstance.questions(APP_DELEGATE.uCurrentUser!, completed: { (questions) -> () in
            self.arrQuestion = questions
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.tvQuestion?.text = (self.arrQuestion[self.iCurrentQuestion] as NSDictionary).objectForKey("content") as! String
            })
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func popViewController(sender: AnyObject) {
        //Check current question to pop up view controller
        if(self.iCurrentQuestion > 0){
            
            self.iCurrentQuestion--
            self.tbvAnswers?.reloadData()
            self.vWrap?.layer.addPushLeftAnimation()
            self.navigationItem.title = NSLocalizedString("questions", comment: "").stringByAppendingString(" \(iCurrentQuestion + 1)")
        }
        else{
            super.popViewController(sender)
        }
    }
    
    override func nextButtonClick(sender: AnyObject) {
        //Check current question to next to result
        if(self.arrAnswer.count >= self.iCurrentQuestion + 1){
            self.iCurrentQuestion++
            self.navigationItem.title = NSLocalizedString("questions", comment: "").stringByAppendingString(" \(iCurrentQuestion + 1)")
            if(self.iCurrentQuestion <= self.arrQuestion.count - 1){
                self.tvQuestion?.text = (self.arrQuestion[self.iCurrentQuestion] as NSDictionary).objectForKey("content") as! String
                self.tbvAnswers?.reloadData()
                self.vWrap?.layer.addPushRightAnimation()
            }
            else{
                let vcResult = StoryboardManager.sharedInstance.getInitialViewController(Storyboard.Result) as! ResultViewController
                self.navigationController?.pushViewController(vcResult, animated: true)
            }
        }
        else{
            UIAlertView(title: NSLocalizedString("error_title", comment: ""), message: NSLocalizedString("question_error_message", comment: ""), delegate: nil, cancelButtonTitle: NSLocalizedString("ok", comment: "")).show()
        }
    }

}

// MARK:UITableviewDelegate, UITableViewDatasource

extension QuestionsViewController:UITableViewDelegate, UITableViewDataSource{
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
        var cell = tableView.dequeueReusableCellWithIdentifier("AnswerCell", forIndexPath: indexPath) as! AnswerCell
        if(self.arrAnswer.count > self.iCurrentQuestion && self.arrAnswer[self.iCurrentQuestion] - 1 == indexPath.row){
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        }
        else{
            cell.accessoryType = UITableViewCellAccessoryType.None
        }
        cell.lblTitle?.text = "\(indexPath.row + 1)"
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if(self.arrAnswer.count >= self.iCurrentQuestion + 1){
            self.arrAnswer[self.iCurrentQuestion] = indexPath.row + 1
        }
        else{
            self.arrAnswer.append(indexPath.row + 1)
        }
        self.tbvAnswers?.reloadData()
    }
}
