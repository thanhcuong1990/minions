//
//  BaseViewController.swift
//  becareer
//
//  Created by Nguyen Phuc Loc on 8/1/15.
//  Copyright (c) 2015 Nguyen Phuc Loc. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // background navigation
        self.navigationController!.navigationBar.setBackgroundImage(UIImage.imageWithColor(UIColor(rgba: "#9EE63D")), forBarMetrics: .Default)
        self.navigationController!.navigationBar.shadowImage = UIImage.imageWithColor(UIColor(rgba: "#9EE63D"))
        self.navigationController?.navigationBar.backgroundColor = UIColor(rgba: "#9EE63D")
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont.systemFontOfSize(18), NSForegroundColorAttributeName:UIColor.whiteColor()]
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
}

//MARK: Private

extension BaseViewController{
    
    func setUpBackButton(){
        var cgrNavigationBar = self.navigationController?.navigationBar.frame.size;
        var btnLeft = UIButton(frame: CGRectMake(0, cgrNavigationBar!.height/10, cgrNavigationBar!.width/10, cgrNavigationBar!.height/1.5))
        btnLeft.imageEdgeInsets = UIEdgeInsets(top: -2.5, left: 0, bottom: 2.5, right: 0)
        btnLeft.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
        btnLeft.setImage(UIImage(named: "back_white"), forState: .Normal)
        btnLeft.setImage(UIImage(named: "back"), forState: .Highlighted)
        btnLeft.addTarget(self, action: "popViewController:", forControlEvents: .TouchUpInside)
        var bbiLeft = UIBarButtonItem(customView: btnLeft)
        
        self.navigationItem.leftBarButtonItems = [self.negativeBarButton(-10),bbiLeft]
    }
    
    func setUpNextButton(){
        var cgrNavigationBar = self.navigationController?.navigationBar.frame.size;
        var btnRight = UIButton(frame: CGRectMake(0, cgrNavigationBar!.height/10, cgrNavigationBar!.width/10, cgrNavigationBar!.height/1.5))
        btnRight.imageEdgeInsets = UIEdgeInsets(top: -2.5, left: 0, bottom: 2.5, right: 0)
        btnRight.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
        btnRight.setImage(UIImage(named: "next_white"), forState: .Normal)
        btnRight.setImage(UIImage(named: "next"), forState: .Highlighted)
        btnRight.addTarget(self, action: "nextButtonClick:", forControlEvents: .TouchUpInside)
        var bbiRight = UIBarButtonItem(customView: btnRight)
        
        self.navigationItem.rightBarButtonItems = [self.negativeBarButton(-10),bbiRight]
    }
    
    func negativeBarButton(negative:CGFloat) -> UIBarButtonItem{
        var bbiNegativeSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FixedSpace, target: nil, action: nil)
        bbiNegativeSpace.width = negative
        return bbiNegativeSpace
    }
    
    func popViewController(sender:AnyObject){
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func nextButtonClick(sender:AnyObject){
        
    }
}
