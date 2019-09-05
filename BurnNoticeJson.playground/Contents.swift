import UIKit

var str = "Hello, playground"

struct CharacterApiResponse: Codable {
    let characterArray: [Character]
    
    enum CharacterAPIResponse: String, CodingKey {
        case characterArray = "RelatedTopics"
    }
}
    struct Character: Codable {
        let charName: String
        let charProperties: CharProperties
        let charSummary: String
        
        enum Character: String, CodingKey {
            case charName = "Text"
            case charProperties = "Icon"
            case charSummary = "Result"
        }
}
struct CharProperties: Codable {
    let charImage: String
    
    enum CharProperties: String, CodingKey {
        case charImage = "URL"
    }
    let CharacterAPIResponseURL = "https://api.duckduckgo.com/?q=burn%20notice%20characters&format=json&pretty=1"
    
    func getData( )
}
