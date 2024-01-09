//
//  UserModel.swift
//  login
//
//  Created by Kiran Gutta on 09/01/24.
//

import Foundation

struct UserManager {
    
    let loginApiURL = "https://api.dev2.constructn.ai/api/v1/users/register"
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
        guard let url = URL(string: loginApiURL) else {
            print("Invalid URL")
            return
                    }
                    if let url = URL(string : loginApiURL) {
                        var request = URLRequest(url : url)
                        request.httpMethod = "POST"
            
                        let parameters : [String : Any] = [
                            "email" : self.email,
                            "password" : self.password
                        ]
            
            
                        if let jsonData = try? JSONSerialization.data(withJSONObject: parameters) {
                            request.httpBody = jsonData
                        }
            
                        print(request)
            
                        let task = URLSession.shared.dataTask(with:request) { (data, response, error) in
                            if let error = error {
                                print("Error: \(error)")
                            }
            
                            else {
                                print(data!)
                                print("Error: Unexpected response")
                            }
                        }
                        task.resume()
            
                    }
        }
}
