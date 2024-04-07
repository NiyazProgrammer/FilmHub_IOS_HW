import Foundation
import Kingfisher

class MainViewModel {

    private let filmsAPIManager: FilmsAPIManager

    private var getPopularFilmsResult: [URL?]? {
        didSet {
            guard let result = getPopularFilmsResult else { return }
            getPopularFilmsResultBlock?(result)
        }
    }

    private var getReviewsResult: [Review]? {
        didSet {
            guard let result = getReviewsResult else { return }
            getReviewsResultBlock?(result)
        }
    }

    var getPopularFilmsResultBlock: (([URL?]) -> Void)?
    var getReviewsResultBlock: (([Review]) -> Void)?

    init(filmsAPIManager: FilmsAPIManager) {
        self.filmsAPIManager = filmsAPIManager
    }

    func getPopularFilmsImages() {
        filmsAPIManager.getFivePopularFilmsImages { [weak self] images in
            self?.getPopularFilmsResult = images
        }
    }

    func getReviews() {
        filmsAPIManager.getReviews { [weak self] reviews in
            self?.getReviewsResult = reviews
        }
    }
}
