//
//  Projects.swift
//  login
//
//  Created by Kiran Gutta on 16/01/24.
//

import Foundation

struct Projects {
//    let name : String
    let company : String
//    let type : String
//    let owner : String
    let email : String
}

struct projectList : Codable {
    let result : [ProjectResults]
}

struct ProjectResults : Codable {
    let type : String
    let name : String
    let company : String
    
}

//
//struct ProjectManager   {
//    let apiurl = "https://api.dev2.constructn.ai/api/v1/users/signin"
//    let authToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsb2dpblR5cGUiOiJjb25zdHJ1Y3RuLW9hdXRoIiwiX2lkIjoiVVNSMDc0NTc5IiwiZmlyc3ROYW1lIjoic2F0aGl5YSBsaW5nZXNoIiwibGFzdE5hbWUiOiJEb2UiLCJlbWFpbCI6InNhdGhpeWFsaW5nZXNoMjAwMkBnbWFpbC5jb20iLCJzdGF0dXMiOiJhY3RpdmUiLCJpc1N1cHBvcnRVc2VyIjpmYWxzZSwiY29udGFjdCI6eyJjb2RlIjoiKzkxIiwibnVtYmVyIjoxMjM0NTY3ODkwfSwidmVyaWZpY2F0aW9uVGltZXN0YW1wcyI6WyIyMDI0LTAxLTAyVDA2OjMxOjE0LjYxNVoiXSwicmVzZXRQYXNzd29yZFRpbWVzdGFtcHMiOltdLCJnZW5kZXIiOiJNYWxlIiwiZG9iIjoiMTk5MC0wMS0wMVQwMDowMDowMC4wMDBaIiwiYWRkcmVzcyI6eyJsaW5lMSI6IjEyMyBNYWluIFN0cmVldCIsImxpbmUyIjoiQXB0IDRCIiwiemlwY29kZSI6IjEyMzQ1IiwiY2l0eSI6IkFueXRvd24iLCJzdGF0ZSI6IkNBIiwiY291bnRyeSI6IlVTQSJ9LCJ2ZXJpZmllZCI6dHJ1ZSwiY3JlYXRlZEF0IjoiMjAyNC0wMS0wMlQwNjozMToxNC41NzlaIiwidXBkYXRlZEF0IjoiMjAyNC0wMS0xMlQwNzo1MDozMS40ODRaIiwiX192IjoxLCJmdWxsTmFtZSI6InNhdGhpeWEgbGluZ2VzaCBEb2UiLCJhZ2UiOjM0LCJjYW5SZXNlbmRWZXJpZmljYXRpb24iOnRydWUsImNhblJlc2V0UGFzc3dvcmQiOnRydWUsInByb3ZpZGVyIjoicGFzc3dvcmQiLCJpYXQiOjE3MDUzODg5MjMsImV4cCI6MTcwNTQ3MTcyM30.cI2r9rV2wCqwNSTuwJP_hANgxdH8JPlf5HYZjSUxTL8"
//  
//    func getProjects() async throws -> projectList {
//        
//        let url = URL(string: apiurl)!
//        let request = URLRequest(url: url)
//        let (data,response) = try await URLSession.shared.data(for: request)
//        if let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//            print("Error")
//        }
//        
//        do {
//            let lists = try JSONDecoder().decode(projectList.self, from: data)
//            print(lists)
//            return lists
//        }
//    }
//    
//}

