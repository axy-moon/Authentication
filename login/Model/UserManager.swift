//
//  UserModel.swift
//  login
//
//  Created by Kiran Gutta on 09/01/24.
//

import Foundation

struct UserManager {
    
    let loginApiURL = ""
    var email = ""
    var password = ""
    
    
    func loginUser(email : String,password : String) {
        print("User Logged In")
    }
    
    func validateEmail() -> Bool {
        let emailRegex = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: self.email)
    }
    
    func sendLoginRequest() {
//        let apiURL = URL("")
            
        print("Api Call")
    }
}
