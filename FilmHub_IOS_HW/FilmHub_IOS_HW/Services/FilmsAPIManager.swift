import Foundation

protocol FilmsAPIManager {

    func getFivePopularFilmsImages(completion: @escaping ([URL?]) -> Void)
    func getReviews(completion: @escaping ([Review]) -> Void)
}
