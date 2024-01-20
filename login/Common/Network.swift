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
