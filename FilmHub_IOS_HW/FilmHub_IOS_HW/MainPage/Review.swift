import Foundation
import UIKit

enum FilmEstimation {
    case Positive
    case Neutral
    case Negative
}

struct Review {
    var avatarImage: URL?
    var filmTitle: String
    var filmYear: Int
    var reviewerName: String
    var rating: FilmEstimation
    var description: String
    var filmImage: URL?
}
