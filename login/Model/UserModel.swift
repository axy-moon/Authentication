import Foundation

struct UserData : Codable {
    let success : Bool
    let result : Result
    
    struct Result : Codable {
        let firstName : String
        let lastName : String
        let email : String
        let token : String
    }
}

struct Profile : Codable {
    let result : Result
    
    struct Result : Codable {
        let fullName : String
        let gender : String
        let email : String
        let contact : Contact
        
        struct Contact : Codable {
            let code : String
            let number : Int
        }
    }
}
