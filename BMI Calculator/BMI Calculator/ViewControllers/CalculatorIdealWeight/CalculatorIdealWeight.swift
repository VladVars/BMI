//
//  CalculatorIdealWeight.swift
//  BMI Calculator
//
//  Created by mac on 24.04.22.
//

import UIKit

class CalculatorIdealWeight: UIViewController {

    @IBOutlet weak var heightField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    var sex = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ageField.backgroundColor = .white
        ageField.textColor = .black
        
        heightField.backgroundColor = .white
        heightField.textColor = .black
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func segmentControlAction(_ sender: Any) {
        switch segmentControl.selectedSegmentIndex{
        case 0:
            sex = 110
        case 1:
            sex = 100
        default:
            break
        }
    }
    
    @IBAction func calculateButton(_ sender: Any) {
        var title = ""
        var message = ""
        
        guard let age = ageField.text,
              let height = heightField.text,
              age.count > 0,
              height.count > 0
        else {
            
            title = "Fields cannot be empty"
            message = "Fill in all the fields"
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(okAction)
            present(alert, animated: true)
            
            return
            
        }
        
        
        let result = Double(height)! - sex
        
        let percent = result / 100 * 11
        
        let secpercent = result / 100 * 6
        
        var totresult = result - 0
        
        if Int(age)! < 30 {
            totresult = result - percent
        }
        if Int(age)! > 50 {
            totresult = result + secpercent
        }
        
        resultLabel.text = "Your ideal weight: \(totresult)"
    }
}
