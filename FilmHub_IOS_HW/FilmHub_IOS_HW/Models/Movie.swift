import Foundation
import SwiftyJSON
import UIKit

struct Movie {
    var name: String
    var picture: UIImage?
    var rayting: Double

    init(json: JSON, image: UIImage) {
        self.name = json["name"].stringValue
        self.rayting = json["rating"]["kp"].doubleValue
        self.picture = image
    }

    init(name: String, image: UIImage?, rayting: Double) {
        self.name = name
        self.picture = image
        self.rayting = rayting
    }    
}
