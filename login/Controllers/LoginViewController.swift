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
    
    var user = UserManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onLoginPress(_ sender: UIButton) {
        
        if emailFIeld.text != "" && passwordField.text != "" {
            user.email = emailFIeld.text!
            user.password = passwordField.text!
            if user.validateEmail() {
                print("Email Validated")
            } else {
                sendAlert(title: "Error", message: "Invalid Email", actionTitle: "Dismiss")
                emailFIeld.text = ""
                passwordField.text = ""
            }
        } else {
            sendAlert(title: "Error", message: "All fields are required", actionTitle: "Dismiss")
        }
    }
    
    func sendAlert(title : String,message: String,actionTitle : String) {
        let uialert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
                uialert.addAction(UIAlertAction(title: actionTitle, style: UIAlertAction.Style.default, handler: nil))
                return self.present(uialert, animated: true, completion: nil)
    }
    
}
