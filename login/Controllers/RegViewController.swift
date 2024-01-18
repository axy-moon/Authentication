//
//  RegViewController.swift
//  login
//
//  Created by Kiran Gutta on 10/01/24.
//

import UIKit

class RegViewController: UIViewController {
    
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
    
    var msg = ""
    
    var user = UserManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onRegisterClick(_ sender: UIButton) {
    
        if firstNameField.text == "" || lastNameField.text == ""  {
            sendAlert(on: self, title: "Error", message: "All Fields are Required", actionTitle: "Dismiss")
        }
        
        let fname = firstNameField.text!
        let lname = lastNameField.text!
        
        if emailField.text != "" && passwordField.text != "" {
            if confirmPasswordField.text == passwordField.text {
                let email = emailField.text!
                let password = passwordField.text!
                let params = ["firstName" :fname,"lastName":lname,"email":email,"password" : password ]
                handleRegister(params: params)
            }
            else {
                sendAlert(on: self, title: "Error", message: "Passwords do not match", actionTitle: "Dismiss")
            }

        } else {
            sendAlert(on: self, title: "Error", message: "All fields are required", actionTitle: "Dismiss")
        }
        
        
        
    }
    
        func handleRegister(params : [String:String]) {
        Task {
            let res = try await user.registerUser(reqBody: params)
            if res {
              print("Success")
            }
            else {
                print("Nakkirich")
            }
        }
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
