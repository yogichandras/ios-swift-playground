//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var tipsyModel = TipsyModel()
    
    @IBOutlet weak var btnTipOne: UIButton!
    @IBOutlet weak var btnTipTwo: UIButton!
    @IBOutlet weak var btnTipThree: UIButton!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var billTotalLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tipsyModel.setPercentage(value: btnTipTwo.currentTitle!)
    }

    @IBAction func btnPressed(_ sender: UIButton) {
        switch sender.currentTitle {
        case "0%":
            btnTipOne.isSelected = true
            btnTipTwo.isSelected = false
            btnTipThree.isSelected = false
        case "10%":
            btnTipOne.isSelected = false
            btnTipTwo.isSelected = true
            btnTipThree.isSelected = false
        default:
            btnTipOne.isSelected = false
            btnTipTwo.isSelected = false
            btnTipThree.isSelected = true
        }
        tipsyModel.setPercentage(value: sender.currentTitle!)
    }
    
    @IBAction func stepPressed(_ sender: UIStepper) {
        tipsyModel.setSplitPerson(value: Int(sender.value))
        splitLabel.text = tipsyModel.getSplitPerson()
    }
    
    @IBAction func btnCalculatePressed(_ sender: UIButton) {
        tipsyModel.setTotalBill(value: billTotalLabel.text!)
        tipsyModel.calculateBill()
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           // Get the new view controller using segue.destination.
           // Pass the selected object to the new view controller.
        if segue.identifier == "goToResult" {
                   let destinationVC = segue.destination as! ResultViewController
            destinationVC.result = tipsyModel.getTotalTip()
            destinationVC.tip = tipsyModel.getPercentage()
            destinationVC.split = tipsyModel.getSplitPerson()
               }
    }
    
}

