//
//  IntroductionViewController.swift
//  becareer
//
//  Created by Nguyen Phuc Loc on 8/1/15.
//  Copyright (c) 2015 Nguyen Phuc Loc. All rights reserved.
//

import UIKit

class IntroductionViewController: BaseViewController {

    @IBOutlet weak var tvDescription: UITextView?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpNextButton()
        self.navigationItem.hidesBackButton = true
        
        self.navigationItem.title = NSLocalizedString("introduction", comment: "")
        var style = NSMutableParagraphStyle()
        style.lineSpacing = 8
        let attributes = [NSParagraphStyleAttributeName : style, NSFontAttributeName:UIFont.systemFontOfSize(15)]
        self.tvDescription?.attributedText = NSAttributedString(string: NSLocalizedString("introduction_description", comment: ""), attributes:attributes)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func nextButtonClick(sender: AnyObject) {
        super.nextButtonClick(sender)
        
        let vcQuestions = StoryboardManager.sharedInstance.getInitialViewController(Storyboard.Questions) as! QustionsViewController
        self.navigationController?.pushViewController(vcQuestions, animated: true)
    }

}
