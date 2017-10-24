//
//  FirstViewController.swift
//  Assignment4
//
//  Created by Kimaya Desai on 10/18/17.
//  Copyright © 2017 SDSU. All rights reserved.
//

import UIKit
import MapKit

class FirstViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
  
    var sports:Dictionary<String,Array<String>>?
    var category:Array<String>?
    var games:Array<String>?
    var selectedType:String?
    
    @IBOutlet weak var Picker1: UIPickerView!

    @IBOutlet weak var Slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if Picker1 != nil {
        Picker1.delegate = self
        Picker1.dataSource = self
        }
        
        let data:Bundle = Bundle.main
        let foodPlist:String? = data.path(forResource: "Picker", ofType: "plist")
        if foodPlist != nil {
            sports = (NSDictionary.init(contentsOfFile: foodPlist!) as! Dictionary)
            category = sports?.keys.sorted()
            selectedType = category![0]
            games = sports![selectedType!]!.sorted()
        }
        
        Slider.setValue(0, animated: true);
    }

    @IBAction func sliderValueChanged(_ sender: Any) {
        Slider.minimumValue = 0
        Slider.maximumValue = Float((games?.count)!)-1
        Picker1.selectRow(Int(Slider.value), inComponent: 1, animated: true)
        Picker1.delegate = self
        Picker1.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        guard (category != nil) && games != nil else { return "None" }
       
        switch component {
        case 0:
             return category![row]
  
        case 1: return games![row]
        default: return "None"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        guard (category != nil) && games != nil else { return 0 }
        switch component {
        case 0: return category!.count
        case 1: return games!.count
        default: return 0
        }
      
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard (category != nil) && games != nil else { return }
        if component == 0 {
            Slider.minimumValue = 0
            Slider.maximumValue = Float((games?.count)!)-1
            selectedType = category![row]
            games = sports![selectedType!]!.sorted()
            pickerView.reloadComponent(1)
        }
        
        if(component == 1){
            Slider.minimumValue = 0
            Slider.maximumValue = Float((games?.count)!)-1
            let n = row
            Slider.setValue(Float(n), animated: true)
        }
        
    }

}
