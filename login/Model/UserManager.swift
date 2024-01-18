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

struct Profile : Codable {
    let result : Res
}

struct Res : Codable {
    let fullName : String
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
    
    func loginUser(reqBody : [String : String]) async throws -> Bool {
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
            return false
        }
        do {
            let res =  try JSONDecoder().decode(UserData.self, from: data)
            UserDefaults.standard.set(res.result.token, forKey: "token")
            return res.success
        }
    }
    
    func registerUser(reqBody : [String : String]) async throws -> Bool {
        
        let registerApiURL = "\(baseURL)users/register"
        let url = URL(string: registerApiURL)!
        var request = URLRequest(url:url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        if let jsonData = try? JSONSerialization.data(withJSONObject: reqBody) {
            request.httpBody = jsonData
        }
        
        let(_ ,response) = try await URLSession.shared.data(for: request)
        if let response = response as? HTTPURLResponse , response.statusCode == 201  {
            return true
        } else {
            return false
        }
    }
    
    func getProfile() async throws -> Profile {
        let profileURL = "\(baseURL)users/profile?companies=false"
        let url = URL(string: profileURL)!
        var request = URLRequest(url: url)
        let token = UserDefaults.standard.string(forKey: "token")!
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        let (data,response) = try await URLSession.shared.data(for: request)
        guard let response = response as? HTTPURLResponse , response.statusCode == 200 else {
            print(response)
            throw APIError.invalidResponse
        }
        let profileData = try JSONDecoder().decode(Profile.self, from: data)
        print(profileData.result.fullName)
        return profileData
    }
}

enum APIError : Error {
    case invalidResponse
}

