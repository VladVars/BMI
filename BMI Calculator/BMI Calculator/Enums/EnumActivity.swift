//
//  Enum.swift
//  BMI Calculator
//
//  Created by mac on 11.05.22.
//

import Foundation

enum ActivityFactor: CaseIterable {
    
    case Sedentary
    case LightlyActive
    case ModeratelyActive
    case VeryActive
    case ExtremelyActive
    
    var activityTitle: String {
        switch self {
        case .Sedentary:
            return "Little or no exercise and desk job"
        case .LightlyActive:
            return "Light exercise or sports 1-3 days a week"
        case .ModeratelyActive:
            return "Moderate exercise or sports 3-5 days a week"
        case .VeryActive:
            return "Hard exercise or sports 6-7 days a week"
        case .ExtremelyActive:
            return "Hard daily exercise or sports and physical job"
        }
    }
    
}


