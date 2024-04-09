//
//  MainScreenTests.swift
//  MainScreenTests
//
//  Created by Азат Зиганшин on 09.04.2024.
//

import XCTest
@testable import FilmHub_IOS_HW


final class MainScreenTests: XCTestCase {

    lazy var kinoPoiskManagerMock = KinoPoiskAPIManagerMock()
    lazy var mainViewModel: MainViewModel = MainViewModel(filmsAPIManager: kinoPoiskManagerMock)

    func test_Recieving_Popular_Films_Success() async {
        // GIVEN
        // nothing

        // WHEN
        await mainViewModel.getPopularFilmsImages()

        // THEN
        XCTAssertEqual(kinoPoiskManagerMock.URLs, mainViewModel.popularFilmsImages)
    }

    func test_Receiving_Reviews_Success() async {
        // GIVEN
        // nothing

        // WHEN
        await mainViewModel.getReviews()

        // THEN
        XCTAssertEqual(kinoPoiskManagerMock.reviews, mainViewModel.recentReviews)
    }

    func testYearRangeString() {
        // GIVEN
        let manager = KinoPoiskAPIManager()

        // WHEN
        let result = manager.yearRangeString()

        // THEN
        XCTAssertFalse(result.isEmpty, "yearRangeString() должен вернуть непустую строку")
        XCTAssertTrue(result.contains("-"), "Результат должен содержать дефис для обозначения диапазона")

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let dates = result.components(separatedBy: "-")
        XCTAssertEqual(dates.count, 2, "Результат должен содержать две даты, разделенные дефисом")
        XCTAssertNotNil(dateFormatter.date(from: dates[0]), "Первая дата должна быть в формате 'dd.MM.yyyy'")
        XCTAssertNotNil(dateFormatter.date(from: dates[1]), "Вторая дата должна быть в формате 'dd.MM.yyyy'")
    }
}
