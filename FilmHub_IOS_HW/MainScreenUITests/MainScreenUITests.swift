//
//  MainScreenUITests.swift
//  MainScreenUITests
//
//  Created by Азат Зиганшин on 09.04.2024.
//

import XCTest

final class MainScreenUITests: XCTestCase {

    func test_CollectionView_Has_Elements() {
        let app = XCUIApplication()
        app.launch()

        let collectionView = app.collectionViews["categories_Collection_View"]
        let cell = collectionView.cells.element(boundBy: 0)

        XCTAssertTrue(collectionView.exists)
        XCTAssertTrue(cell.exists)
    }

    func test_StackView_Has_Correct_Count_Elements() {
        let app = XCUIApplication()
        app.launch()

        let stackView = app.otherElements["popular_Films_Stack_View"]

        XCTAssertTrue(stackView.exists)
        XCTAssertEqual(stackView.children(matching: .any).count, 5)
    }
}
