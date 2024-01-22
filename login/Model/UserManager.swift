//
//  UserModel.swift
//  login
//
//  Created by Kiran Gutta on 09/01/24.
//

import Foundation


struct UserManager {
    
    
    func loginUser(email : String,password : String) {
        print("User Logged In")
    }
    
    func validateEmail(email : String) -> Bool {
        let emailRegex = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    func loginUser(reqBody : [String : String]) async throws -> Bool {
        let loginApiURL = "\(Constants.API_BASE_URL)users/signin"
        let url = URL(string : loginApiURL)!
        let request = makePostRequest(parameters: reqBody, url: url)
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
        
        let registerApiURL = "\(Constants.API_BASE_URL)users/register"
        let url = URL(string: registerApiURL)!
        let request = makePostRequest(parameters: reqBody, url: url)
        let(_ ,response) = try await URLSession.shared.data(for: request)
        if let response = response as? HTTPURLResponse , response.statusCode == 201  {
            return true
        } else {
            return false
        }
    }
    

    
    func getProfile() async throws -> Profile {
        let profileURL = "\(Constants.API_BASE_URL)users/profile?companies=false"
        let url = URL(string: profileURL)!

        let request = try makeGetRequestWithToken(url: url)
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










