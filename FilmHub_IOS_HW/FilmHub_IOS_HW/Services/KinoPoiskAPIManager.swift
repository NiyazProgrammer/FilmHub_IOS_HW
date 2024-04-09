import Foundation
import SwiftyJSON
import Alamofire
import Kingfisher
import UIKit

class KinoPoiskAPIManager: FilmsAPIManager {

    private let apiKey = "7QNZ39K-0NYMDFY-K57NSVF-WEPGZCW"

    func getFivePopularFilmsImages(completion: @escaping ([URL?]) -> Void) {

        var result: [URL?] = []

        let parameters = ["sortField" : "votes.imdb", "sortType" : "-1", "limit" : "5", "selectFields" : "poster", "premiere.world" : yearRangeString()]

        let headers: HTTPHeaders = [
            "X-API-KEY": apiKey,
            "accept": "application/json"
        ]

        AF.request("https://api.kinopoisk.dev/v1.4/movie", parameters: parameters, headers: headers).response { response in
            switch response.result {
            case .success(let data):
                if let jsonData = data {
                    do {
                        let json = try JSON(data: jsonData)["docs"]
                        for item in json.arrayValue {
                            let imageURL = URL(string: item["poster"]["url"].stringValue)
                            result.append(imageURL)
                        }
                        completion(result)
                    } catch {
                        print("Error parsing JSON:", error)
                        completion([])
                    }
                }
            case .failure(let error):
                print(error)
                completion([])
            }
        }
    }

    private func yearRangeString() -> String {
        let currentDate = Date()
        let calendar = Calendar.current

        let today = calendar.startOfDay(for: currentDate)

        guard let oneYearAgo = calendar.date(byAdding: .year, value: -1, to: today) else {
            return ""
        }

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let todayString = dateFormatter.string(from: today)
        let oneMonthAgoString = dateFormatter.string(from: oneYearAgo)

        let yearRange = "\(oneMonthAgoString)-\(todayString)"

        return yearRange
    }

    func getReviews(completion: @escaping ([Review]) -> Void) {

        var result: [Review] = []

        let parameters = ["limit" : "5", "page" : "2"]

        let headers: HTTPHeaders = [
            "X-API-KEY": apiKey,
            "accept": "application/json"
        ]

        let group = DispatchGroup()

        AF.request("https://api.kinopoisk.dev/v1.4/review", parameters: parameters, headers: headers).response { response in
            switch response.result {
            case .success(let data):
                if let jsonData = data {
                    do {
                        let json = try JSON(data: jsonData)["docs"]
                        for review in json.arrayValue {

                            group.enter()

                            let filmId = review["movieId"].stringValue

                            self.getFilmById(id: filmId) { movieJSON in

                                let reviewerName = review["author"].stringValue
                                let description = review["review"].stringValue

                                let filmTitle = movieJSON[0]["name"].stringValue
                                let filmYear = movieJSON[0]["year"].intValue
                                let filmImage = URL(string: movieJSON[0]["poster"]["url"].stringValue)

                                let estimation = review["type"].stringValue
                                var rating: FilmEstimation = FilmEstimation.Neutral
                                switch estimation {
                                case "Позитивный":
                                    rating = FilmEstimation.Positive
                                case "Негативный":
                                    rating = FilmEstimation.Negative
                                case "Нейтральный":
                                    rating = FilmEstimation.Neutral
                                default:
                                    break
                                }

                                let reviewModel = Review(filmTitle: filmTitle, filmYear: filmYear, reviewerName: reviewerName, rating: rating, description: description, filmImage: filmImage)
                                result.append(reviewModel)

                                group.leave()
                            }
                        }
                        group.notify(queue: .main) {
                            completion(result)
                        }
                    } catch {
                        print("Error parsing JSON:", error)
                        completion([])
                    }
                }
            case .failure(let error):
                print(error)
                completion([])
            }
        }
    }

    private func getFilmById(id: String, completion: @escaping ((JSON) -> Void)) {

        let parameters = ["id" : id]

        let headers: HTTPHeaders = [
            "X-API-KEY": apiKey,
            "accept": "application/json"
        ]

        AF.request("https://api.kinopoisk.dev/v1.4/movie", parameters: parameters, headers: headers).response { response in
            switch response.result {
            case .success(let data):
                if let jsonData = data {
                    do {
                        let json = try JSON(data: jsonData)["docs"]
                        completion(json)
                    } catch {
                        print("Error parsing JSON:", error)
                        completion(JSON())
                    }
                }
            case .failure(let error):
                print(error)
                completion(JSON())
            }
        }
    }
}
