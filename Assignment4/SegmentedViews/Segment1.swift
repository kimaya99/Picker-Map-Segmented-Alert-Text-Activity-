//
//  Segment1.swift
//  Assignment4
//
//  Created by Kimaya Desai on 10/21/17.
//  Copyright © 2017 SDSU. All rights reserved.
//

import UIKit

class Segment1: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    var justText: String!
    
    @IBOutlet weak var progressIndicator: UIActivityIndicatorView!
    @IBAction func switchOn(_ sender: Any) {
    
    }
    
    func customInit(justText: String){
        self.justText = justText
    }
    override func viewDidLoad() {
        super.viewDidLoad()
label.text = justText
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
