//
//  CalculatorBMI.swift
//  BMI Calculator
//
//  Created by mac on 24.04.22.
//

import UIKit

class CalculatorBMI: UIViewController {
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    @IBOutlet weak var heightValue: UILabel!
    @IBOutlet weak var weightValue: UILabel!
    
    @IBOutlet weak var bmiLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func heightSliderAction(_ sender: UISlider) {
        
        let height = String(format: "%.2f", sender.value)
        heightValue.text = "\(height) Cm"
    }
    @IBAction func weightSliderAction(_ sender: UISlider) {
        let weight = String(format: "%.0f", sender.value)
        weightValue.text = "\(weight) Kg"
    }
    @IBAction func calculateButton(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        let calculateBMI = weight / (height * height)
        let totalBMI = String(format: "%.2f", calculateBMI)
        if totalBMI <= String(16) {
            bmiLabel.textColor = .red
        }
        if totalBMI > String(16) && totalBMI <= String(21) {
            bmiLabel.textColor = .yellow
        }
        if totalBMI > String(21) && totalBMI <= String(27)  {
            bmiLabel.textColor = .green
        }
        if totalBMI > String(27) {
            bmiLabel.textColor = .red
        }
        bmiLabel.text = "You BMI is \n \(totalBMI)"
    }
    



}
