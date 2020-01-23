//
//  Calculator.swift
//  BMI Calculator
//
//  Created by owner on 23/1/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    var bmiValue:BMI?
    
    mutating func calculateBMI(height:Float, weight:Float){
        let calculate = weight / (height * height)
        if(calculate > 24.9){
            bmiValue = BMI(value: calculate, advice: "Eat less pies", color: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))
        }else if(calculate >= 18.5){
            bmiValue = BMI(value: calculate, advice: "Fir as a fiddle!", color: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
        }else{
            bmiValue = BMI(value: calculate, advice: "Eat more pies", color: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
        }
       
    }
    
    func getBMIValue() -> String {
        return String(format: "%.0f", bmiValue?.value ?? "0.0")
    }
    
    func getAdvice() -> String {
        return bmiValue?.advice ?? ""
    }
    
    func getColor() -> UIColor {
        return bmiValue?.color ?? UIColor.white
    }
    
}
