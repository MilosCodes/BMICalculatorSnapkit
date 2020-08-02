//
//  CalculatorBrain.swift
//  BMICalculatorSnapkit
//
//  Created by Milos Milivojevic on 25/07/2020.
//  Copyright © 2020 Milos Milivojevic. All rights reserved.
//

import UIKit


struct CalculatorBrain {
    
    var bmi: BMI?
    
    
    func toOneDecimalNumber() -> String {
        let decimalToOneNumber = String(format: "%.1f", bmi?.value ?? 0.0)
        return decimalToOneNumber
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No Advice"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? .white
    }
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / (height * height)
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more pies", color: UIColor.blue)
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Fit as fiddle", color: UIColor.green)
        } else {
            bmi = BMI(value: bmiValue, advice: "Eat lesspies!", color: UIColor.red)
        }
    }
}
