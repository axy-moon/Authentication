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
            user.email = emailFIeld.text!
            user.password = passwordField.text!
            if user.validateEmail() {
                do {
                    Task {
                        let success = try await performLogin()
                    DispatchQueue.main.async {
                                if (success) {
                                    self.performSegue(withIdentifier: "loginSuccess", sender: self)
                                } else {
                                    self.sendAlert(title: "Access Denied", message: "Invalid Credentials", actionTitle: "Dismiss")
                                }
                    }
                    }
                    
                }
            } else {
                sendAlert(title: "Error", message: "Invalid Email", actionTitle: "Dismiss")
                emailFIeld.text = ""
                passwordField.text = ""
            }
        } else {
                sendAlert(title: "Error", message: "All fields are required", actionTitle: "Dismiss")
            }
    }
    
    @IBAction func registerButton(_ sender: UIButton) {
        performSegue(withIdentifier: "register", sender: self)
    }
    func sendAlert(title : String,message: String,actionTitle : String) {
        let uialert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
                uialert.addAction(UIAlertAction(title: actionTitle, style: UIAlertAction.Style.default, handler: nil))
                return self.present(uialert, animated: true, completion: nil)
    }
    
    
    func performLogin() async throws -> Bool {
        do {
            let res = try await user.sendLoginRequest()
            username = res.result.firstName + " " + res.result.lastName
            print(username)
            return res.success
        }
        catch LoginError.invalidResponse {
            print("Response Error")
            return false
        }
        catch {
            print("Unexpected Error")
                return false
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "register" {
            let destinationVC = segue.destination as! RegViewController
            destinationVC.msg = "Success"
        }
        
        else if segue.identifier == "loginSuccess" {
            let destinationVC = segue.destination as! HomeViewController
            destinationVC.username = username
        }
    }
    
}

