//
//  UserModel.swift
//  login
//
//  Created by Kiran Gutta on 09/01/24.
//

import Foundation

struct UserData : Codable {
    let result : Result
}

struct Result : Codable {
    let firstName : String
    let lastName : String
    let email : String
}

struct UserManager {
    
    let loginApiURL = "https://api.dev2.constructn.ai/api/v1/users/signin"
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
    
    func sendLoginRequest() 
    {
        
                    if let url = URL(string : loginApiURL) {
                        var request = URLRequest(url : url)
                        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                        request.httpMethod = "POST"
            
                        let parameters : [String : String] = [
                            "email" : "Sathiyalingesh2002@gmail.com",
                            "password" : "password123"
                        ]
                        

            
                        if let jsonData = try? JSONSerialization.data(withJSONObject: parameters) {
                            request.httpBody = jsonData
                        }
            
                        print(request)
            
                        let task =  URLSession.shared.dataTask(with:request) { (data, response, error) in
                            if let error = error {
                                print("Error: \(error)")
                            }
            
                            else {
                                let userData =  try? JSONDecoder().decode(UserData.self, from: data!)
                                print(userData!)
                                print("Augxy Moon")
                            }
                        }
                        task.resume()
            
                    }
        }
}
