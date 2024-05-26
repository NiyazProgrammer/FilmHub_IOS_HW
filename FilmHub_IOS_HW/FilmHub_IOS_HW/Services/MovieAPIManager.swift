import Foundation
import Alamofire
import UIKit
import SwiftyJSON
import Kingfisher

class MovieAPIManager {

    private let apiKey = "7HCM5B3-FXX4615-K5RHZFF-F2MV5ZV"
    private let baseURL = "https://api.kinopoisk.dev"

    func fetchMovieDetails(movieID: Int, completion: @escaping (Result<Movie, Error>) -> Void) {
        let url = "\(baseURL)/v1.4/movie/\(movieID)"
        let headers: HTTPHeaders = ["X-API-KEY": apiKey]

        AF.request(url, headers: headers).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let movie = Movie(json: json)
                completion(.success(movie))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
