//
//  SegmentViewController1.swift
//  Assignment4
//
//  Created by Kimaya Desai on 10/22/17.
//  Copyright © 2017 SDSU. All rights reserved.
//

import UIKit

class SegmentViewController1: UIViewController {
    
    
    @IBOutlet weak var activityIndicatie: UIActivityIndicatorView!
    
    @IBOutlet weak var swicther: UILabel!
    
    @IBAction func switchOn(_ sender: UISwitch) {
        if (sender.isOn == true)
        {
            swicther.text = "Progress Indicator is ON"
            activityIndicatie.center = self.view.center
            activityIndicatie.hidesWhenStopped = false
            activityIndicatie.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
            
            view.addSubview(activityIndicatie)
            
            activityIndicatie.startAnimating()
            
        }
        else
        {
                swicther.text = "Progress Indicator is OFF"
                activityIndicatie.stopAnimating()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
