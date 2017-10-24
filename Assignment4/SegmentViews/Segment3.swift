//
//  Segment3.swift
//  Assignment4
//
//  Created by Kimaya Desai on 10/21/17.
//  Copyright © 2017 SDSU. All rights reserved.
//

import UIKit

class Segment3: UIViewController {
  var sample = 1
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showSheet(_ sender: Any) {
        let controller = UIAlertController(title: "Iphone!", message: "Do you like IPhone?",preferredStyle: .actionSheet)
        
        let bAction = UIAlertAction(title: "Yes", style: .default, handler: {action in print("Yes")})
        let cAction = UIAlertAction(title: "No", style: .default, handler: {action in print("No")})
        let cancelAction = UIAlertAction(title: "Not Sure", style: .cancel, handler: nil)
        controller.addAction(cancelAction)
        
        controller.addAction(cAction)
        controller.addAction(bAction)
        self.present(controller, animated: true, completion: {print("Done")})
    }
  
   
    

  

}
