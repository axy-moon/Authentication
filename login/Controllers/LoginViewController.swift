//
//  ViewController.swift
//  login
//
//  Created by Kiran Gutta on 08/01/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailFIeld: UITextField!
    
    var username = ""
    
    var user = UserManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onLoginPress(_ sender: UIButton) {
        
        if emailFIeld.text != "" && passwordField.text != "" {
            let email = emailFIeld.text!
            let password = passwordField.text!
            if user.validateEmail(email: email) {
               handleLogin(email: email, password: password)
            } else {
                sendAlert(on : self ,title: "Error", message: "Invalid Email", actionTitle: "Dismiss")
                emailFIeld.text = ""
                passwordField.text = ""
            }
        } else {
            sendAlert(on : self, title: "Error", message: "All fields are required", actionTitle: "Dismiss")
            }
    }
    
    @IBAction func registerButton(_ sender: UIButton) {
        performSegue(withIdentifier: "register", sender: self)
    }

    
    func handleLogin(email : String,password : String) {
        Task {
            let res = try await user.loginUser(reqBody:  ["email" : email,"password":password])
            if res {
                performSegue(withIdentifier:"loginSuccess", sender: self)
            }
            else {
                sendAlert(on: self, title: "Error", message: "Invalid Credentials", actionTitle: "Retry")
            }
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "register" {
            let destinationVC = segue.destination as! RegViewController
            destinationVC.msg = "Success"
        }
        
        else if segue.identifier == "loginSuccess" {
            let destinationVC = segue.destination as! UITabBarController
            destinationVC.modalPresentationStyle = .fullScreen
        }
    }
    
}
