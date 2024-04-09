import Foundation
import UIKit
import Combine

class ProfileViewModel {
    @Published var movies: [Movie] = []
    @Published var favoriteMovies: [Movie] = []
    let favoriteFilmsId: [Int]
    let recentFilmsId: [Int]
    var getAllMovies: (([Movie]) -> Void)?
    var getFavoriteMovies: (([Movie]) -> Void)?
    var networkServices: ProfileAPIManagerNetworkServices

    init(favoriteFilmsId: [Int], recentFilmsId: [Int], networkServices: ProfileAPIManagerNetworkServices) {
        self.favoriteFilmsId = favoriteFilmsId
        self.recentFilmsId = recentFilmsId
        self.networkServices = networkServices
    }

    func ratingConversation(with modifiedFilms: [Movie]) -> [Movie]  {
        var movies = modifiedFilms
        for index in 0..<movies.count {
            movies[index].rayting = roundRatingDown((movies[index].rayting) / 2)
        }
        return movies
    }

    // MARK: Округляем значение рейтинга вниз до ближайшего целого числа
    func roundRatingDown(_ rating: Double) -> Double {
        let roundedRating = floor(rating * 2) / 2
        return roundedRating
    }

    func loadUsersFilms(with favoriteFilmsId: [Int], with recentFilmsId: [Int]) {
        networkServices.loadUsersFilms(with: recentFilmsId, completion: { movies in
            if var newMovies = movies {
                newMovies = self.ratingConversation(with: newMovies)
                self.movies = newMovies
            }

        })
        networkServices.loadUsersFilms(with: favoriteFilmsId, completion: { movies in
            if var newMovies = movies {
                newMovies = self.ratingConversation(with: newMovies)
                self.favoriteMovies = newMovies
            }
        })
    }
}
