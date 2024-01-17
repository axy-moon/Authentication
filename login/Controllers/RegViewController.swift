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
    
        guard firstNameField.text?.isEmpty == false && lastNameField.text?.isEmpty == false else { return }
        let fname = firstNameField.text!
        let lname = lastNameField.text!
        let email = emailField.text!
        let password = passwordField.text!
        
        let registered = sendRegisterRequest(fname: fname, lname: lname, email: email, password: password)
        if registered {
            print("Register Successful")
        } else {
            print("Error")
        }
        
    
    }
    
    func sendRegisterRequest()
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
