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
        
        self.setUpNextButton()
        self.tfName?.placeholder = NSLocalizedString("name", comment: "")
        self.tfEmail?.placeholder = NSLocalizedString("email", comment: "")
        self.lblLanguage?.text = NSLocalizedString("language", comment: "")
        
        self.vName?.layer.addBorderCorner(UIColor.whiteColor(), corner: 10, width: 1)
        self.vEmail?.layer.addBorderCorner(UIColor.whiteColor(), corner: 10, width: 1)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func nextButtonClick(sender: AnyObject) {
        self.goToIntroduction()
    }
    
    // MARK: IBActions
    
    @IBAction func vWrapTapped(sender: AnyObject) {
        self.view.endEditing(true)
    }

}

//MARK: Private
extension RegisterViewController{
    func goToIntroduction(){
        APIClient.sharedInstance.register(self.tfName!.text!, email: self.tfEmail!.text!) { (responseObj) -> () in
            APP_DELEGATE.uCurrentUser = responseObj
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                let vcIntroduction = StoryboardManager.sharedInstance.getInitialViewController(Storyboard.Introduction) as! IntroductionViewController
                self.navigationController?.pushViewController(vcIntroduction, animated: true)
            })
        }
    }
}

//MARK:UITextFieldDelegate
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
                self.goToIntroduction()
            }
        }
        return true
    }
}
