//
//  RegisterViewController.swift
//  becareer
//
//  Created by Nguyen Phuc Loc on 8/1/15.
//  Copyright (c) 2015 Nguyen Phuc Loc. All rights reserved.
//

import UIKit

class RegisterViewController: BaseViewController {

    @IBOutlet weak var imgvLogo: UIImageView?
    @IBOutlet weak var tfName: UITextField?
    @IBOutlet weak var tfEmail: UITextField?
    @IBOutlet weak var lblLanguage: UILabel?
    @IBOutlet weak var btnLanguage: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tfName?.placeholder = NSLocalizedString("name", comment: "")
        self.tfEmail?.placeholder = NSLocalizedString("email", comment: "")
        self.lblLanguage?.text = NSLocalizedString("language", comment: "")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
