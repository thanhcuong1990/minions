//
//  QustionsViewController.swift
//  becareer
//
//  Created by Nguyen Phuc Loc on 8/1/15.
//  Copyright (c) 2015 Nguyen Phuc Loc. All rights reserved.
//

import UIKit

class QustionsViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpBackButton()
        self.setUpNextButton()
        
        self.navigationItem.title = NSLocalizedString("questions", comment: "")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func popViewController(sender: AnyObject) {
        
    }
    
    override func nextButtonClick(sender: AnyObject) {
        
    }

}
