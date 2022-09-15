//
//  ViewController.swift
//  Perfect Prime Rib
//
//  Created by Alex Luu on 12/30/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var weightText: UILabel!
    @IBOutlet weak var weightInputBox: UITextField!
    
    @IBOutlet weak var rareSlider: UISlider!
    @IBOutlet weak var p1t: UILabel!
    @IBOutlet weak var rareTemp: UILabel!
    
    @IBOutlet weak var p1c: UILabel!
    
    @IBOutlet weak var cookTimeInHrMin: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func rareSliderInput(_ sender: Any) {
        rareTemp.text=String(round(rareSlider.value+120)) + " F"
        p1t.text=String(round(((2.0/15.0)*Double(rareSlider.value)+31.0)*(Double(weightInputBox.text!)!))) + " min"
        
        let minTime=round(((2.0/15.0)*Double(rareSlider.value)+31.0)*(Double(weightInputBox.text!)!))
        
        cookTimeInHrMin.text = String(Int(minTime)/60) + " hr " + String(Int(minTime)%60) + " min"
    } // End rareSliderInput
    
    @IBAction func weightUserInput(_ sender: Any, forEvent event: UIEvent) {
        
        p1t.text=String(round(((2.0/15.0)*Double(rareSlider.value)+31.0)*(Double(weightInputBox.text!)!))) + " min"
        
        let minTime=round(((2.0/15.0)*Double(rareSlider.value)+31.0)*(Double(weightInputBox.text!)!))
        
        cookTimeInHrMin.text = String(Int(minTime)/60) + " hr " + String(Int(minTime)%60) + " min"
        
        if(Double(weightInputBox.text!)!<=5.0){
            p1c.text="25 min"
        }
        if(Double(weightInputBox.text!)!>=8.0){
            p1c.text="28 min"
        }
        if(Double(weightInputBox.text!)!>5.0 && Double(weightInputBox.text!)!<=7.0){
            p1c.text="26 min"
        }
        if(Double(weightInputBox.text!)!>7.0 && Double(weightInputBox.text!)!<8.0){
            p1c.text="27 min"
        }
        self.hideKeyboardWhenTappedAround()
        
    } // End weightUserInput
    
    
}



extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)

    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}





