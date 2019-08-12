//
//  NextViewController.swift
//  Elemental
//
//  Created by Zacharias A. Konfor on 8/9/19.
//  Copyright © 2019 Zacharias A. Konfor. All rights reserved.
//

import Foundation
import UIKit

protocol NextViewControllerDelegate {
    func updateString(with value: String)
}

class NextViewController: UIViewController {
    
    @IBOutlet weak var Slider: UISlider!
    @IBOutlet weak var TextField: UITextField!
    @IBOutlet weak var Stepper: UIStepper!
    @IBOutlet weak var Switch: UISwitch!
    @IBOutlet weak var SegmentedControl: UISegmentedControl!
    var editString: String?
    var delegate: NextViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TextField.text = editString
    }
    
    @IBAction func Submit(_ sender: UIButton) {
        delegate?.updateString(with: TextField.text ??
            "")
       
        
     navigationController?.popViewController(animated: true)
    
    }
    @IBAction func Stepper(_ sender: UIStepper){
        if Stepper.isHidden == false{
            TextField.isHidden = true
            Switch.isHidden = true
            SegmentedControl.isHidden = true
            Slider.isHidden = true
            
        }
        
        
    }
    
        
    
    @IBAction func Switch(_ sender: UISwitch) {
        if Switch.isHidden == false{
            TextField.isHidden = true
        }


    }
    
    
    @IBAction func SegmentedControl(_ sender: UISegmentedControl) {
        
        if SegmentedControl.isHidden == false {
            TextField.isHidden = true
        }
        
        
        
    }
    
    
    @IBAction func Slider(_ sender: UISlider) {
       
        if Slider.isHidden == false {
           TextField.isHidden = true
            
        }

        // if the slider is not hidden, hide the textfield
    }
    
    @IBAction func TextField(_ sender: UITextField) {
        
        if Slider.isHidden == false {
            TextField.isHidden = true
    }
}
}
