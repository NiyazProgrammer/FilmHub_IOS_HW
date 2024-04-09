import XCTest
@testable import FilmHub_IOS_HW

final class ProfileScreenTests: XCTestCase {
    private var favoriteFilmsId: [Int] = [300, 355, 480, 550]
    private var recentFilmsId: [Int] = [330, 345, 680, 750, 555, 384, 465, 660, 1000]

    private lazy var viewModel = ProfileViewModel(favoriteFilmsId: favoriteFilmsId, recentFilmsId: recentFilmsId, networkServices: NetworkServicesMock())

    // MARK: У нас рейтинговая система расчитана до 5.0, а в API рейтинговая система до 10
    func test_Rating_Conversation() throws {
        // GIVEN
        let movies: [Movie] = [
            Movie(name: "Movie 1", image: UIImage(named: ""), rayting: 10.0),
            Movie(name: "Movie 2", image: UIImage(named: ""), rayting: 8.9),
            Movie(name: "Movie 3", image: UIImage(named: ""), rayting: 6.4),
        ]

        // WHEN
        let result = viewModel.ratingConversation(with: movies)

        // THEN
        XCTAssertEqual(result[0].rayting, 5.0)
        XCTAssertEqual(result[1].rayting, 4.0)
        XCTAssertEqual(result[2].rayting, 3.0)
    }

    // MARK: Проверка округления в меньшую сторону
    func test_Round_Rating_Down() throws {
        // GIVEN
        let rating = 3.6

        // WHEN
        let result = viewModel.roundRatingDown(rating)

        // THEN
        XCTAssertEqual(result, 3.5)
    }
    
    // MARK: Проверка загрузки фильмов
    func test_Load_Films() {
        let filmIds = [330, 345, 680, 750, 555, 384, 465, 660, 1000]
        var resultMovies: [Movie]?

        let expectation = expectation(description: "Load users films")
        viewModel.networkServices.loadUsersFilms(with: filmIds) { movies in
            resultMovies = movies
            expectation.fulfill()
        }
        // MARK: ожидает пока все expectations не закончать свою работу
        waitForExpectations(timeout: 1.0)
    }
}
