//
//  ProfileUITests.swift
//  ProfileUITests
//
//  Created by Нияз Ризванов on 09.04.2024.
//

import XCTest
@testable import FilmHub_IOS_HW

final class ProfileUITests: XCTestCase {

    override func setUpWithError() throws {
    }

    // MARK: Проверка существования карточек любимых фильмов пользователя
    func test_Favorite_Films() throws {
        let app = XCUIApplication()
        app.launch()

        let favoriteFilmsSV = app.otherElements["Favorite_Films_Cards_Stack_View"]

        XCTAssert(favoriteFilmsSV.exists)
    }

    // MARK: Проверка существования недавно просмотренных фильмов
    func test_Recent_Films() {
        let app = XCUIApplication()
        app.launch()

        let recentFilmsCV = app.collectionViews["Recently_Films_Collection_View"]

        XCTAssert(recentFilmsCV.exists)
    }
}
