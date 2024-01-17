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
//
//{
//  "firstName": "axy",
//  "lastName": "moon",
//  "email": "canotc25@gmail.com",
//  "password": "password123"
//}

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
    
    let baseURL = "https://api.dev2.constructn.ai/api/v1/"
    
    func loginUser(email : String,password : String) {
        print("User Logged In")
    }
    
    func validateEmail(email : String) -> Bool {
        let emailRegex = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    func sendLoginRequest(reqBody : [String : String]) async throws -> UserData {
        let loginApiURL = "\(baseURL)users/signin"
        let url = URL(string : loginApiURL)!
        var request = URLRequest(url : url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        if let jsonData = try? JSONSerialization.data(withJSONObject: reqBody) {
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
    
    func registerUser(fname : String,lname : String,email : String,password : String) async throws -> Bool {
        
        let registerApiURL = "\(baseURL)users/register"
        let url = URL(string: registerApiURL)!
        var request = URLRequest(url:url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        let parameter = [
            "firstName" : fname,
            "lastName" : lname,
            "email" : email,
            "password" : password
        ]
        
        if let jsonData = try? JSONSerialization.data(withJSONObject: parameter) {
            request.httpBody = jsonData
        }
        
        let(data,response) = try await URLSession.shared.data(for: request)
        if let response = response as? HTTPURLResponse , response.statusCode == 201  {
            return true
        } else{
            return false
        }
    }
}

enum LoginError : Error {
    case invalidResponse
}
