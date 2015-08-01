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
    @IBOutlet weak var scvWrap: UIScrollView?
    @IBOutlet weak var vName: UIView?
    @IBOutlet weak var vEmail: UIView?
    @IBOutlet weak var tfName: UITextField?
    @IBOutlet weak var tfEmail: UITextField?
    @IBOutlet weak var lblLanguage: UILabel?
    @IBOutlet weak var btnLanguage: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tfName?.placeholder = NSLocalizedString("name", comment: "")
        self.tfEmail?.placeholder = NSLocalizedString("email", comment: "")
        self.lblLanguage?.text = NSLocalizedString("language", comment: "")
        
        self.vName?.layer.addBorderCorner(UIColor(rgba: "#e2e2e2"), corner: 10, width: 1)
        self.vEmail?.layer.addBorderCorner(UIColor(rgba: "#e2e2e2"), corner: 10, width: 1)
        
        self.navigationItem.title = NSLocalizedString("register", comment: "")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: IBActions
    
    @IBAction func vWrapTapped(sender: AnyObject) {
        self.view.endEditing(true)
    }

}

extension RegisterViewController:UITextFieldDelegate{
    
    func textFieldDidBeginEditing(textField: UITextField) {
        if(DeviceType.IS_IPHONE_5 || DeviceType.IS_IPHONE_4_OR_LESS){
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.scvWrap?.contentOffset = CGPointMake(0, textField.frame.maxY)
            })
        }
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        if(DeviceType.IS_IPHONE_5 || DeviceType.IS_IPHONE_4_OR_LESS){
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.scvWrap?.contentOffset = CGPointMake(0, 0)
            })
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if(textField == self.tfName){
            self.tfEmail?.becomeFirstResponder()
        }
        else{
            if(HelperManager.sharedInstance.isValidEmail(self.tfEmail!.text!) == false || self.tfName?.text == "" ){
                UIAlertView(title: NSLocalizedString("error_title", comment: ""), message: NSLocalizedString("register_error_message", comment: ""), delegate: nil, cancelButtonTitle: NSLocalizedString("ok", comment: "")).show()
            }
            else {
                let vcIntroduction = StoryboardManager.sharedInstance.getInitialViewController(Storyboard.Introduction) as! IntroductionViewController
                self.navigationController?.pushViewController(vcIntroduction, animated: true)
            }
        }
        return true
    }
}
