//
//  WebViewController.swift
//  becareer
//
//  Created by Nguyen Phuc Loc on 8/1/15.
//  Copyright (c) 2015 Nguyen Phuc Loc. All rights reserved.
//

import UIKit

class WebViewController: BaseViewController {

    @IBOutlet weak var wbvLoader: UIWebView?
    var sUrl:String?
    var sUniversity:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpBackButton()
        self.navigationItem.title = self.sUniversity
        self.wbvLoader?.loadRequest(NSURLRequest(URL: NSURL(string: self.sUrl!)!))
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
