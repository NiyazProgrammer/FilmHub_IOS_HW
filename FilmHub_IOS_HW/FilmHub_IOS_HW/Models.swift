import Foundation
import SwiftyJSON

struct Movie {
    let title: String
    let year: Int
    let director: String
    let description: String
    let rating: Double
    let mainPhotoURL: String
    let backgroundPhotoURL: String

    init(json: JSON) {
        self.title = json["name"].stringValue
        self.year = json["year"].intValue
        self.director = json["directors"].arrayValue.first?["name"].stringValue ?? "Unknown"
        self.description = json["description"].stringValue
        self.rating = json["rating"]["kp"].doubleValue
        self.mainPhotoURL = json["poster"]["url"].stringValue
        self.backgroundPhotoURL = json["backdrop"]["url"].stringValue
    }
}
