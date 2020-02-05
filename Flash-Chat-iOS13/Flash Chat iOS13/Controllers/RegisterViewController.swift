//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        
        if let email = emailTextfield.text , let password = passwordTextfield.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    // create the alert
                    let alert = UIAlertController(title: "Error", message: e.localizedDescription, preferredStyle: UIAlertController.Style.alert)

                          // add an action (button)
                          alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                          // show the alert
                          self.present(alert, animated: true, completion: nil)
                }else{
                    self.performSegue(withIdentifier: Constants.registerToChat, sender: self)
                }
            }
        }
    }
    
}