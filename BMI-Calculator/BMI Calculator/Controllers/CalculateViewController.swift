//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var heightSliderVal: UISlider!
    @IBOutlet weak var wightSliderVal: UISlider!
    var calculateBrain = CalculatorBrain()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func sliderHeight(_ sender: UISlider) {
        let rounded = String(format: "%.2f", sender.value)
        heightLabel.text = "\(rounded)m"
        print(rounded)
    }
    
    @IBAction func weightSlider(_ sender: UISlider) {
        let rounded = String(format: "%.0f", sender.value)
        weightLabel.text = "\(rounded)kg"
        print(rounded)
    }
    
    @IBAction func calculateButton(_ sender: UIButton) {
        let height = heightSliderVal.value
        let weight = wightSliderVal.value
        calculateBrain.calculateBMI(height: height, weight: weight)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           // Get the new view controller using segue.destination.
           // Pass the selected object to the new view controller.
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculateBrain.getBMIValue()
            destinationVC.advice = calculateBrain.getAdvice()
            destinationVC.color = calculateBrain.getColor()
        }
        
       }
    
}

