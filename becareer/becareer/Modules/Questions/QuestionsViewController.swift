//
//  QustionsViewController.swift
//  becareer
//
//  Created by Nguyen Phuc Loc on 8/1/15.
//  Copyright (c) 2015 Nguyen Phuc Loc. All rights reserved.
//

import UIKit

class QuestionsViewController: BaseViewController {

    @IBOutlet weak var tvQuestion: UITextView?
    @IBOutlet weak var tbvAnswers: UITableView?
    
    var arrQuestion:Array<Question> = Array()
    var arrAnswer:Array<Dictionary<String,Int>> = Array()
    var iCurrentQuestion = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpBackButton()
        self.setUpNextButton()
        
        self.navigationItem.title = NSLocalizedString("questions", comment: "")
        self.tbvAnswers?.registerNib(UINib(nibName: "AnswerCell", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: "AnswerCell")
        self.tbvAnswers?.layer.addTopLine(UIColor(rgba: "#e2e2e2"), width: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func popViewController(sender: AnyObject) {
        if(arrQuestion.count > 0){
            //TODO: Push previous question
            
        }
        else{
            super.popViewController(sender)
        }
    }
    
    override func nextButtonClick(sender: AnyObject) {
        
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
        cell.lblTitle?.text = "Answer"
        return cell
    }
}