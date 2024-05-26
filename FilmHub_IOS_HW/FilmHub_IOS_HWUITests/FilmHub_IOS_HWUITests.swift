import XCTest
@testable import FilmHub_IOS_HW

class MovieScreenUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launch()
    }

    func testMovieScreenElements() throws {
        let movieTitle = app.staticTexts["movieTitle"]
        XCTAssertTrue(movieTitle.exists, "Movie title should be displayed")

        let movieYearTitle = app.staticTexts["movieYearTitle"]
        XCTAssertTrue(movieYearTitle.exists, "Movie year should be displayed")

        let movieDirectorTitle = app.staticTexts["movieDirectorTitle"]
        XCTAssertTrue(movieDirectorTitle.exists, "Movie director should be displayed")

        let movieDescriptionLabel = app.staticTexts["movieDescriptionLabel"]
        XCTAssertTrue(movieDescriptionLabel.exists, "Movie description should be displayed")

        let scoreRatingLabel = app.staticTexts["scoreRatingLabel"]
        XCTAssertTrue(scoreRatingLabel.exists, "Movie rating should be displayed")

        let movieMainPhoto = app.images["movieMainPhoto"]
        XCTAssertTrue(movieMainPhoto.exists, "Movie main photo should be displayed")

        let moviePhotoBackground = app.images["moviePhotoBackground"]
        XCTAssertTrue(moviePhotoBackground.exists, "Movie background photo should be displayed")
    }

    func testRateTheFilmButton() {
        let rateTheFilmButton = app.buttons["rateTheFilmButton"]
        rateTheFilmButton.tap()

        print("rateTheFilmButton work")
    }
    func testMovieAboutButton() {
        let movieAboutButton = app.buttons["movieAboutButton"]
        movieAboutButton.tap()

        print("movieAboutButton work")
    }
}
