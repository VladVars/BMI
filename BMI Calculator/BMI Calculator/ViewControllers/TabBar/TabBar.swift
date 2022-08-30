//
//  TabBar.swift
//  BMI Calculator
//
//  Created by mac on 24.04.22.
//

import UIKit

class TabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = .white
        tabBar.barTintColor = .white
        setupBarControllers()

    }
    private func setupBarControllers() {
        let bmiVC = CalculatorBMI(nibName: String(describing: CalculatorBMI.self), bundle: nil)
        let calorieVC = CalculatorCalorie(nibName: String(describing: CalculatorCalorie.self), bundle: nil)
        let idealWeightVC = CalculatorIdealWeight(nibName: String(describing: CalculatorIdealWeight.self), bundle: nil)
        
        bmiVC.tabBarItem = UITabBarItem(title: "BMI", image: nil, tag: 0)
        calorieVC.tabBarItem = UITabBarItem(title: "COLORIE", image: nil, tag: 1)
        idealWeightVC.tabBarItem = UITabBarItem(title: "IDEAL WEIGHT", image: nil, tag: 2)
        
        self.viewControllers = [bmiVC, calorieVC, idealWeightVC]
        
    }

}
