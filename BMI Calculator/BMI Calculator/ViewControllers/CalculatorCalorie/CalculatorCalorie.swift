//
//  CalculatorCalorie.swift
//  BMI Calculator
//
//  Created by mac on 24.04.22.
//

import UIKit

class CalculatorCalorie: UIViewController {
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var heightField: UITextField!
    @IBOutlet weak var weightField: UITextField!
    @IBOutlet weak var activityField: UITextField!
    @IBOutlet weak var purposeField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    private var activityFactor: [ActivityFactor] = ActivityFactor.allCases
    private var activityPicker = UIPickerView()
    
    private var purpose: [Purpose] = Purpose.allCases
    private var purposePicker = UIPickerView()
    
    var sex = 0.0
    
    var activity = 0.0
    
    var resulr = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityPicker.dataSource = self
        activityPicker.delegate = self
        purposePicker.dataSource = self
        purposePicker.delegate = self
        activityField.inputView = activityPicker
        purposeField.inputView = purposePicker
        activityPicker.tag = 0
        purposePicker.tag = 1
        
        ageField.backgroundColor = .white
        ageField.textColor = .black
        
        heightField.backgroundColor = .white
        heightField.textColor = .black
        
        weightField.backgroundColor = .white
        weightField.textColor = .black
        
        activityField.backgroundColor = .white
        activityField.textColor = .black
        
        purposeField.backgroundColor = .white
        purposeField.textColor = .black
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func segmentControlSex(_ sender: Any) {
        switch segmentControl.selectedSegmentIndex{
        case 0:
            sex = 5
        case 1:
            sex = -160
        default:
            break
        }
    }
    
    @IBAction func calculateButton(_ sender: Any) {
        
        var title = ""
        var message = ""
        
        guard let weight = weightField.text,
              let height = heightField.text,
              let age = ageField.text,
              let activ = activityField.text,
              let purpose = purposeField.text,
              weight.count > 0,
              height.count > 0,
              age.count > 0,
              activ.count > 0,
              purpose.count > 0
                
        else {
            
            title = "Fields cannot be empty"
            message = "Fill in all the fields"
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(okAction)
            present(alert, animated: true)
            
            return
            
        }
        
        
        if activityField.text == "Little or no exercise and desk job" {
            activity = 1.2
        }
        if activityField.text == "Light exercise or sports 1-3 days a week" {
            activity = 1.375
        }
        if activityField.text == "Moderate exercise or sports 3-5 days a week" {
            activity = 1.55
        }
        if activityField.text == "Hard exercise or sports 6-7 days a week" {
            activity = 1.725
        }
        if activityField.text == "Hard daily exercise or sports and physical job" {
            activity = 1.9
        }
        
        let result = (10.0 * Double(weight)!) + (6.25 * Double(height)!) - (5.0 * Double(age)!) + (sex)
        
        let secresult = result * (activity)
        
        let percent = secresult / 100 * 20
        
        var totresult = secresult - percent
        
        
        if purposeField.text == "Weight aintenance" {
            totresult = secresult - 0
        }
        if purposeField.text == "Weight loss" {
            totresult = secresult - percent
        }
        if purposeField.text == "Weight gain" {
            totresult = secresult + percent
        }
        
        resultLabel.text = "Your daily colorie intake: \(totresult)"
        
    }
}

extension CalculatorCalorie: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 0:
            return activityFactor.count
        case 1:
            return purpose.count
        default:
            return 0
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 0:
            return activityFactor[row].activityTitle
        case 1:
            return purpose[row].purpose
        default:
            return ""
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 0:
            activityField.text = activityFactor[row].activityTitle
        case 1:
            purposeField.text = purpose[row].purpose
        default:
            break
        }
        activityField.resignFirstResponder()
        purposeField.resignFirstResponder()
    }
    
}

