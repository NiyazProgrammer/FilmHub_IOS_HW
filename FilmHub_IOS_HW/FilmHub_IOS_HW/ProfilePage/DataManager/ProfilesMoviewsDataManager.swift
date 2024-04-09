import Foundation
import UIKit

class ProfilesMoviewsDataManager {
    static let shared = ProfilesMoviewsDataManager()

    private init () {}

    var favoriteFilmsId: [Int] = [300, 355, 480, 550]
    var recentFilmsId: [Int] = [330, 345, 680, 750, 555, 384, 465, 660, 1000]
}
