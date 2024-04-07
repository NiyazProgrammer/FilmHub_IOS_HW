import Foundation
import UIKit
import SwiftyJSON
import Alamofire
import Kingfisher

// MARK: For profile screen
class ProfileAPIManager {

    // MARK: second token
    // private let token = "HT3PQM0-VNJ4K6S-MH82Q18-JJMT2JX"`

    private let token = "3K25FYF-6X9M6XA-PMN7ZJJ-ZE71TA2"

    func loadUsersFilms(with recentFilmId: [Int], completion: @escaping ([Movie]?) -> Void)  {
        var movies: [Movie] = []
        let headers: HTTPHeaders = [
            "X-API-KEY": token,
            "Accept" : "application/json"
        ]
        let dispatchGroup = DispatchGroup()
        for filmId in recentFilmId {
                dispatchGroup.enter()
                AF.request("https://api.kinopoisk.dev/v1.4/movie/\(filmId)", method: .get, headers: headers)
                    .response { response in
                        switch response.result {
                        case .success(let value):
                            if let jsonData = value {
                                do {
                                    let json = try JSON(data: jsonData)
                                    if let url =  URL(string:  json["poster"]["previewUrl"].stringValue) {
                                        self.getImageFilm(with: url) { image in
                                            movies.append(Movie(json: json, image: image ?? UIImage()))
                                            dispatchGroup.leave()
                                        }
                                    }
                                }
                                catch {
                                    print("Error \(error)")
                                    dispatchGroup.leave()
                                }
                            }
                        case .failure(let error):
                            print("Error: \(error)")
                            dispatchGroup.leave()
                        }
                    }
            }
            dispatchGroup.notify(queue: .main) {
                completion(movies)
            }
    }

    private func getImageFilm(with url: URL, completion: @escaping (UIImage?) -> Void) {
        KingfisherManager.shared.retrieveImage(with: url) { result in
            switch result {
            case .success(let imageResult):
                completion(imageResult.image)
            case .failure(let error):
                print("Error loading image: \(error)")
                completion(nil)
            }
        }
    }
}
