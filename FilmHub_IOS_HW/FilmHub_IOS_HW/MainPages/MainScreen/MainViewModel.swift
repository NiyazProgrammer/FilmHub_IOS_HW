//
//  HomeViewModel.swift
//  ScrollView
//
//  Created by Азат Зиганшин on 01.04.2024.
//

import Foundation
import Kingfisher
import Combine

class MainViewModel {

    private let filmsAPIManager: FilmsAPIManager

    @Published var popularFilmsImages: [URL?] = []
    @Published var recentReviews: [Review] = []

    var getPopularFilmsResultBlock: (([URL?]) -> Void)?
    var getReviewsResultBlock: (([Review]) -> Void)?

    init(filmsAPIManager: FilmsAPIManager) {
        self.filmsAPIManager = filmsAPIManager
    }

    func getPopularFilmsImages() async {
        filmsAPIManager.getFivePopularFilmsImages { [weak self] images in
            self?.popularFilmsImages = images
        }
    }

    func getReviews() async {
        filmsAPIManager.getReviews { [weak self] reviews in
            self?.recentReviews = reviews
        }
    }
}
