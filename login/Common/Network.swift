//
//  Network.swift
//  login
//
//  Created by Kiran Gutta on 20/01/24.
//

import Foundation

func makePostRequest(parameters : [String : String], url : URL) -> URLRequest {
    var request = URLRequest(url:url)
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpMethod = "POST"
    
    if let jsonParameters = try? JSONSerialization.data(withJSONObject: parameters) {
        request.httpBody = jsonParameters
    }
    return request
}

func makeRequestWithToken(url:URL,method : String) throws -> URLRequest {
    var request = URLRequest(url : url)
    guard let token = UserDefaults.standard.string(forKey: "token") else {
        throw APIError.tokenNotFoundError }
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
    request.httpMethod = method
    
    return request
}
