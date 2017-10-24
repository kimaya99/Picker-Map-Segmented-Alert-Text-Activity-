//
//  SegmentViewController2.swift
//  Assignment4
//
//  Created by Kimaya Desai on 10/22/17.
//  Copyright © 2017 SDSU. All rights reserved.
//

import UIKit

class SegmentViewController2: UIViewController, UITextViewDelegate {

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textView.delegate = self
        countLabel.text = "\(textView.text.characters.count)"
        NotificationCenter.default.addObserver(self, selector: #selector(SegmentViewController2.updateTextView(notification: )), name: Notification.Name.UIKeyboardWillChangeFrame, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(SegmentViewController2.updateTextView(notification: )), name: Notification.Name.UIKeyboardWillHide , object: nil)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.backgroundColor = UIColor.white
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.backgroundColor = UIColor.white
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    @objc func updateTextView(notification: Notification){
        let userInfo = notification.userInfo!
        
        let keyboardEndFrameScreenCoordinates = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        let keyboardEndFrane = self.view.convert(keyboardEndFrameScreenCoordinates, from: view.window)
        
        if notification.name == Notification.Name.UIKeyboardWillHide{
            textView.contentInset = UIEdgeInsets.zero
        } else{
           textView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardEndFrane.height, right: 0)
            textView.scrollIndicatorInsets = textView.contentInset
        }
        textView.scrollRangeToVisible(textView.selectedRange)
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        countLabel.text = "\(textView.text.characters.count)"
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
