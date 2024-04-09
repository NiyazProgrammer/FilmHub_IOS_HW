import Foundation
import UIKit
@testable import FilmHub_IOS_HW

class NetworkServicesMock: ProfileAPIManagerNetworkServices {
    func loadUsersFilms(with recentFilmId: [Int], completion: @escaping ([Movie]?) -> Void) {
        var movies: [Movie] = []
        for filmId in recentFilmId {
            let movie = Movie(name: "Movie \(filmId)", image: nil, rayting: 0.0) // Подставьте свои данные
            movies.append(movie)
        }
        completion(movies)
    }
}
