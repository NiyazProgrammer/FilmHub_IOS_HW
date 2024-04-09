//
//  Extensions.swift
//  MainScreenTests
//
//  Created by Азат Зиганшин on 09.04.2024.
//

import Foundation
@testable import protocol FilmHub_IOS_HW.FilmsAPIManager
@testable import struct FilmHub_IOS_HW.Review
@testable import enum FilmHub_IOS_HW.FilmEstimation
@testable import struct FilmHub_IOS_HW.Review

extension Review: Equatable {
    public static func == (lhs: Review, rhs: Review) -> Bool {
        lhs.avatarImage == rhs.avatarImage && lhs.filmTitle == rhs.filmTitle &&
        lhs.filmYear == rhs.filmYear && lhs.reviewerName == rhs.reviewerName &&
        lhs.rating == rhs.rating && lhs.description == rhs.description &&
        lhs.filmImage == rhs.filmImage
    }
}

class KinoPoiskAPIManagerMock: FilmsAPIManager {
    let URLs = [
        URL(string: "https://image.openmoviedb.com/kinopoisk-images/1946459/5c758ac0-7a5c-4f00-a94f-1be680a312fb/orig"),
        URL(string: "https://image.openmoviedb.com/kinopoisk-images/1704946/e9008e2f-433f-43b0-b9b8-2ea8e3fb6c9b/orig"),
        URL(string: "https://image.openmoviedb.com/kinopoisk-images/6201401/90d57813-387c-44c4-81c1-ecddb3c417a5/orig")
    ]
    let reviews = [
        Review(filmTitle: "Джон Уик", filmYear: 2018, reviewerName: "Anton", rating: FilmEstimation.Positive, description: "MockMockMockMockMockMockMockMockMockMockMockMockMockMockMock"),
        Review(filmTitle: "Астрал", filmYear: 2010, reviewerName: "Malika", rating: FilmEstimation.Neutral, description: "MockMockMockMockMockMockMockMockMockMockMockMockMockMockMockMockMockMock")
    ]

    func getFivePopularFilmsImages(completion: @escaping ([URL?]) -> Void) {
        completion(URLs)
    }

    func getReviews(completion: @escaping ([Review]) -> Void) {
        completion(reviews)
    }
}
