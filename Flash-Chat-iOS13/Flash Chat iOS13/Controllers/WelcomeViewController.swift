//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import CLTypingLabel

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: CLTypingLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = Constants.appName
//        let title = "⚡️FlashChat"
//        var letterIndex = 0.0
//        for letter in title{
//            Timer.scheduledTimer(withTimeInterval: 0.1 * letterIndex, repeats: false) { (timer) in
//                self.titleLabel.text?.append(letter)
//            }
//            letterIndex += 1
//        }
       
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if sender.currentTitle! == "Register" {
            self.performSegue(withIdentifier: Constants.registerRoute, sender: self)
        } else {
            self.performSegue(withIdentifier: Constants.loginRoute, sender: self)
        }
    }
    
    
}
