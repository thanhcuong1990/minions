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
        self.setUpBackButton()
        
        self.navigationItem.title = NSLocalizedString("introduction", comment: "")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
