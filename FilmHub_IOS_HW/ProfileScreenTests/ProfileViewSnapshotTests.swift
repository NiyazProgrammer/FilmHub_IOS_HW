//
//  ProfileViewSnapshotTests.swift
//  ProfileScreenFilmHubIOSHWTests
//
//  Created by Нияз Ризванов on 09.04.2024.
//

import XCTest
import SnapshotTesting

@testable import FilmHub_IOS_HW

final class ProfileViewSnapshotTests: XCTestCase {

    override func setUpWithError() throws {
        
    }

    func test_Profile_Screen_In_Iphone_SE() throws {
        let viewModel = ProfileViewModel(favoriteFilmsId: [350,448,565,869], recentFilmsId: [350,448,565,869], networkServices: NetworkServicesMock())
        let profileCV = ProfileViewController(viewModel: viewModel)

        assertSnapshot(of: profileCV, as: .image(traits: .iPhoneSe(.landscape)))
    }

    func test_Profile_Screen_In_Ipad() throws {
        let viewModel = ProfileViewModel(favoriteFilmsId: [350,448,565,869], recentFilmsId: [350,448,565,869], networkServices: NetworkServicesMock())
        let profileCV = ProfileViewController(viewModel: viewModel)

        assertSnapshot(of: profileCV, as: .image(traits: .iPhone13(.landscape)))
    }

}
