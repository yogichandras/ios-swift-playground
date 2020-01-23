//
//  TipsyModel.swift
//  Tipsy
//
//  Created by owner on 23/1/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation
struct TipsyModel {
    var splitPerson: Int = 2
    var totalBill: Float = 0.0
    var percentage: Float = 0.0
    var resultTip: String = ""
    
    mutating func setSplitPerson(value: Int){
        splitPerson = value
    }
    
    func getSplitPerson() -> String {
        return String(splitPerson)
    }
    
    mutating func calculateBill(){
        let result = (totalBill * (1+percentage)) / Float(splitPerson)
        resultTip = String(format: "%.2f", result)
    }
    
    mutating func setPercentage(value: String){
          let percent = Float(value.replacingOccurrences(of: "%", with: "", options: NSString.CompareOptions.literal, range: nil))! / Float(100)
        percentage = roundFloat(value: Double(percent))
    }
    
    func getPercentage() -> String {
        return String(Int(percentage * 100))
    }
    
    mutating func setTotalBill(value: String){
        totalBill = roundFloat(value: Double(Float(value)!))
    }
    
    func getTotalTip() -> String {
        return resultTip
    }
    
    func roundFloat(value: Double) -> Float{
        let numberOfPlaces = 2.0
        let multiplier = pow(10.0, numberOfPlaces)
        let num = value
        let rounded = round(num * multiplier) / multiplier
        return Float(rounded)
    }
    
}
