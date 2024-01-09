//
//  UserModel.swift
//  login
//
//  Created by Kiran Gutta on 09/01/24.
//

import Foundation

struct UserManager {
    
    let loginApiURL = "http://192.168.1.10:3000/api/email"
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
        
                    if let url = URL(string : loginApiURL) {
                        var request = URLRequest(url : url)
                        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                        let encoder = JSONEncoder()
                        request.httpMethod = "POST"
            
                        let parameters : [String : String] = [
                                    "from": "assistify.psgtech@gmail.com",
                                     "to": email,
                                     "subject": "Mail from Swift Post API",
                                     "text": "Test Email for Swift"
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
                                print("Augxy Moon")
                            }
                        }
                        task.resume()
            
                    }
        }
}
