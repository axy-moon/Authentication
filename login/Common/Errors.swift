//
//  Errors.swift
//  login
//
//  Created by Kiran Gutta on 19/01/24.
//

import Foundation

enum LoginError : Error {
    case invalidCredentials
    case emailDoesNotExist
    case userNotFound
}

enum APIError : Error {
    case invalidResponse
    case decodeError
    case invalidURL
}


