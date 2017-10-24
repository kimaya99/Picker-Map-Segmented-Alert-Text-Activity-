//
//  SegmentViewController3.swift
//  Assignment4
//
//  Created by Kimaya Desai on 10/22/17.
//  Copyright © 2017 SDSU. All rights reserved.
//

import UIKit

class SegmentViewController3: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
   
    
    @IBAction func btnAlertButton(_ sender: AnyObject) {
        
         let alert = UIAlertController(title:"Review",message:"Do you like Iphone?", preferredStyle : .alert)
     
         let YesAction = UIAlertAction(title: "Yes", style: .destructive, handler: nil)
        
         let noAction = UIAlertAction(title:"No",style: .default,handler:nil)
        
         let closeAction = UIAlertAction(title: "Close", style: .cancel, handler: nil)
 
        alert.addAction(YesAction)
        alert.addAction(noAction)
        alert.addAction(closeAction)
        self.present(alert,animated: true,completion: nil)
        
    }
}
