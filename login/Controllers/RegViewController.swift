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
        
        if let email = emailField.text {
            if let password = passwordField.text {
                let params = ["firstName" :fname,"lastName":lname,"email":email,"password" : password ]
                handleRegister(params: params)
            }
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
