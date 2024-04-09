//
//  MainViewSnapshotTests.swift
//  MainScreenTests
//
//  Created by Азат Зиганшин on 09.04.2024.
//

import XCTest
import SnapshotTesting
@testable import FilmHub_IOS_HW

final class MainViewSnapshotTests: XCTestCase {

    func test_On_iPadMini() {
        let mainViewModel = MainViewModel(filmsAPIManager: KinoPoiskAPIManagerMock())
        let mainViewController = MainViewController(mainViewModel: mainViewModel)

        assertSnapshot(of: mainViewController, as: .image(traits: .iPadMini))
    }

    func test_On_iPhoneSE() {
        let mainViewModel = MainViewModel(filmsAPIManager: KinoPoiskAPIManagerMock())
        let mainViewController = MainViewController(mainViewModel: mainViewModel)

        assertSnapshot(of: mainViewController, as: .image(traits: .iPhoneSe(.portrait)))
    }
}
