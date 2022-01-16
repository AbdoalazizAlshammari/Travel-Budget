//
//  ViewController.swift
//  Travel-Budget
//
//  Created by Mac on 07/12/2021.
//

import UIKit
import FirebaseFirestore
// calss
class SelectedBudgetVC: UIViewController {
    
    var casee: Int?
    
    var selectedCase:String?
    var setSelectedCase:String?
    
    var selctedCase : Countries?
    
    @IBOutlet weak var sliderValue: UISlider!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let currentval = Int(sliderValue.value)
        label.text = "\(currentval)" + "SAR".localize
    }
    func displayAlert(withTitle title: String, message: String,isFound: Bool) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okFound = UIAlertAction(title:NSLocalizedString("Ok", comment: ""), style: .default, handler: { action in
            if isFound {
                self.performSegue(withIdentifier: "ToCountries", sender: nil)
            } else {
                
            }
            
        })
        alert.addAction(okFound)
        self.present(alert, animated: true)
    }
    @IBAction func sliderDidSlide(_ sender: UISlider) {
        
        let currentVal = Int(sliderValue.value)
        label.text = "\(currentVal) SAR".localize
    }
    
    @IBAction func searchButton(_ sender: Any) {
        let currentval = sliderValue.value
        switch currentval {
            
        case 5000...10000:
            casee = 0
        case 10000...25000:
            casee = 1
        case 25000...50000:
            casee = 2
        case 50000...75000:
            casee = 3
        case 75000...100000:
            casee = 4
        default:
            
            displayAlert(withTitle: NSLocalizedString(" No trip Found".localize, comment: ""), message: "", isFound: false)
        }
        performSegue(withIdentifier: "ToCountries", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! CountriesVC
        vc.casees = casee
    }
}

extension String {
    
    var localize:String {
        return NSLocalizedString(self, comment: "")
    }
    
}
