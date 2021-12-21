//
//  ViewController.swift
//  Travel-Budget
//
//  Created by Mac on 07/12/2021.
//

import UIKit
import Firebase

class SelectedBudgetVC: UIViewController {

    @IBOutlet weak var sliderValue: UISlider!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let currentval = Int(sliderValue.value)
        label.text = "\(currentval)"
    }
    @IBAction func SliderDidSlide(_ sender: UISlider) {
        
        let currentval = Int(sliderValue.value)
        label.text = "\(currentval)"
    }
    
    @IBAction func SearchButton(_ sender: Any) {
        if sliderValue.value == 4999 {
            print("No trip was found")
        }
        else{
            print("success")
        }
        performSegue(withIdentifier: "ToCountries", sender: nil)
    }


}


