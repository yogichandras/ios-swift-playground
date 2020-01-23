//
//  ResultViewController.swift
//  Tipsy
//
//  Created by owner on 24/1/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var result: String?
    var tip: String?
    var split: String?
    
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var labelResult: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        labelResult.text = result
        labelDescription.text = "Split between \(split!) people, With \(tip!)% tip"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func reCalculate(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
