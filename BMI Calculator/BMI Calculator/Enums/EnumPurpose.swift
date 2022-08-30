//
//  EnumPurpose.swift
//  BMI Calculator
//
//  Created by mac on 11.05.22.
//

import Foundation

enum Purpose: CaseIterable {
    
    case Weightmaintenance
    case Weightloss
    case Weightgain
    
    var purpose: String {
        switch self {
        case .Weightmaintenance:
            return "Weight aintenance"
        case .Weightloss:
            return "Weight loss"
        case .Weightgain:
            return "Weight gain"
        }
    }
}
