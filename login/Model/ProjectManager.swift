import Foundation

struct Projects {
    let company : String
    let email : String
}

struct ProjectList : Codable {
    let success : Bool
    let result : [Result]
    struct Result : Codable {
        let status : String
        let name : String
    }
}

struct ProjectManager {
    
     func getProjects() async throws -> ProjectList {
        let projectsURL = "\(Constants.API_BASE_URL)/projects"
        let url = URL(string: projectsURL)!
        var request = try makeRequestWithToken(url: url, method: "GET")
        let (data,response) = try await URLSession.shared.data(for: request)
        guard let response = response as? HTTPURLResponse , response.statusCode == 200 else {
            print(response)
            throw APIError.invalidResponse
        }
        
        guard let projects = try? JSONDecoder().decode(ProjectList.self, from: data) else {
            throw APIError.decodeError
        }
        print("Projects" , projects.success)
        return projects
    }
}
