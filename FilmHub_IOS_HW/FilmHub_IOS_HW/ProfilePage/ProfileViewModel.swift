import Foundation
import UIKit

class ProfileViewModel {
    private var movies: [Movie] = [] {
        willSet {
            (getAllMovies ?? {_ in})(newValue)
        }
    }
    private var favoriteMovies: [Movie] = [] {
        willSet {
            (getFavoriteMovies ?? {_ in})(newValue)
        }
    }
    private var reviews: [Movie] = []
    private let services = ProfileAPIManager()
    let favoriteFilmsId: [Int]
    let recentFilmsId: [Int]
    var getAllMovies: (([Movie]) -> Void)?
    var getFavoriteMovies: (([Movie]) -> Void)?

    init(favoriteFilmsId: [Int], recentFilmsId: [Int]) {
        self.favoriteFilmsId = favoriteFilmsId
        self.recentFilmsId = recentFilmsId
    }

    private func ratingConversation(with modifiedFilms: [Movie]) -> [Movie]  {
        var movies = modifiedFilms
        for index in 0..<movies.count {
            movies[index].rayting = roundRatingDown((movies[index].rayting) / 2)
        }
        return movies
    }

    // MARK: Округляем значение рейтинга вниз до ближайшего целого числа
    private func roundRatingDown(_ rating: Double) -> Double {
        let roundedRating = floor(rating * 2) / 2
        return roundedRating
    }

    func loadUsersFilms(with favoriteFilmsId: [Int], with recentFilmsId: [Int]) {
        services.loadUsersFilms(with: recentFilmsId, completion: { movies in
            if var newMovies = movies {
                newMovies = self.ratingConversation(with: newMovies)
                self.movies = newMovies
            }

        })
        services.loadUsersFilms(with: favoriteFilmsId, completion: { movies in
            if var newMovies = movies {
                newMovies = self.ratingConversation(with: newMovies)
                self.favoriteMovies = newMovies
            }
        })
    }
}
