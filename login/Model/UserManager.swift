//
//  UserModel.swift
//  login
//
//  Created by Kiran Gutta on 09/01/24.
//

import Foundation

struct UserData : Codable {
    let success : Bool
    let result : Result
}

struct Result : Codable {
    let firstName : String
    let lastName : String
    let email : String
    let token : String
}

struct NewUser {
    let firstName : String
    let lastName : String
    let email : String
    let password : String
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
    
    func sendLoginRequest() async throws -> UserData {
        let url = URL(string : loginApiURL)!
        var request = URLRequest(url : url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let parameters : [String : String] = [
            "email" : email,
            "password" : password
        ]
        if let jsonData = try? JSONSerialization.data(withJSONObject: parameters) {
            request.httpBody = jsonData
        }
        print(request)
        let (data,response) =  try await URLSession.shared.data(for:request)
        guard let response = response as? HTTPURLResponse, response.statusCode == 201 else {
            throw LoginError.invalidResponse
        }
        do {
            let res =  try JSONDecoder().decode(UserData.self, from: data)
            print(res.result.token)
            print(response)
            return res
        }
    }
}

enum LoginError : Error {
    case invalidResponse
}
