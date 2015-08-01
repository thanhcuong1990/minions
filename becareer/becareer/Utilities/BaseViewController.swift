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

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

//MARK: Private

extension BaseViewController{
    func setUpBackButton(){
        var cgrNavigationBar = self.navigationController?.navigationBar.frame.size;
        var btnLeft = UIButton(frame: CGRectMake(0, cgrNavigationBar!.height/10, cgrNavigationBar!.width/10, cgrNavigationBar!.height/1.5))
        btnLeft.imageEdgeInsets = UIEdgeInsets(top: -2.5, left: 0, bottom: 2.5, right: 0)
        btnLeft.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
        btnLeft.setImage(UIImage(named: "back"), forState: .Normal)
        btnLeft.setImage(UIImage(named: "back_white"), forState: .Highlighted)
        btnLeft.addTarget(self, action: "popViewController:", forControlEvents: .TouchUpInside)
        var bbiLeft = UIBarButtonItem(customView: btnLeft)
        
        self.navigationItem.leftBarButtonItems = [self.negativeBarButton(-10),bbiLeft]
    }
    
    func negativeBarButton(negative:CGFloat) -> UIBarButtonItem{
        var bbiNegativeSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FixedSpace, target: nil, action: nil)
        bbiNegativeSpace.width = negative
        return bbiNegativeSpace
    }
    
    func popViewController(sender:AnyObject){
        self.navigationController?.popViewControllerAnimated(true)
    }
}
