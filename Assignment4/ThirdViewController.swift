//
//  ThirdViewController.swift
//  Assignment4
//
//  Created by Kimaya Desai on 10/22/17.
//  Copyright © 2017 SDSU. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var segmentSelect: UISegmentedControl!
    
    lazy var segmentViewController1: SegmentViewController1 = {
        let storyboard = UIStoryboard(name:"Main",bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(withIdentifier: "SegmentViewController1") as! SegmentViewController1
        
        self.addViewControllerAsChildViewController(childViewController: viewController)
        return viewController
    }()
    
    lazy var segmentViewController2: SegmentViewController2 = {
        let storyboard = UIStoryboard(name:"Main",bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(withIdentifier: "SegmentViewController2") as! SegmentViewController2
        
         self.addViewControllerAsChildViewController(childViewController: viewController)
        return viewController
    }()
    
    lazy var segmentViewController3: SegmentViewController3 = {
        let storyboard = UIStoryboard(name:"Main",bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(withIdentifier: "SegmentViewController3") as! SegmentViewController3
        
        self.addViewControllerAsChildViewController(childViewController: viewController)
        return viewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    private func setupView(){
        setupSegmentControl()
        updateView()
    }
    
    private func updateView(){
        if segmentSelect.selectedSegmentIndex == 0
        {
            segmentViewController1.view.isHidden = false
            segmentViewController2.view.isHidden = true
            segmentViewController3.view.isHidden = true
        }
        
        else if segmentSelect.selectedSegmentIndex == 1 {
            segmentViewController1.view.isHidden = true
            segmentViewController2.view.isHidden = false
            segmentViewController3.view.isHidden = true
        }
        
        else {
            segmentViewController1.view.isHidden = true
            segmentViewController2.view.isHidden = true
            segmentViewController3.view.isHidden = false
        }
       
    }
    
    private func setupSegmentControl(){
        segmentSelect.removeAllSegments()
        segmentSelect.insertSegment(withTitle: "Progress", at: 0, animated: false)
        segmentSelect.insertSegment(withTitle: "Text", at: 1, animated: false)
        segmentSelect.insertSegment(withTitle: "Alert", at: 2, animated: false)
        segmentSelect.addTarget(self, action: #selector(selectionDidChange (sender:)), for: .valueChanged)
        
        segmentSelect.selectedSegmentIndex = 0
    }
    
    @objc func selectionDidChange (sender: UISegmentedControl){
        updateView()
    }
    
    private func addViewControllerAsChildViewController(childViewController :UIViewController){
        addChildViewController(childViewController)
        
        view.addSubview(childViewController.view)
        
        childViewController.view.frame = view.bounds
        childViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        childViewController.didMove(toParentViewController: self)
    }
    
    private func removeFromParentViewController(childViewController : UIViewController) {
        childViewController.willMove(toParentViewController: nil)
        childViewController.view.removeFromSuperview()
        childViewController.removeFromParentViewController()
        
    }
}
