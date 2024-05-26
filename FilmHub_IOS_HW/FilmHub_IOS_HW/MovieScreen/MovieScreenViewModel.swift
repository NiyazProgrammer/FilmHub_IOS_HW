class MovieScreenViewModel {

    weak var viewController: MovieScreenViewController?

    init(viewController: MovieScreenViewController) {
        self.viewController = viewController
    }

    func fetchMovieDetails() {
        let movieID = 12345
        MovieAPIManager().fetchMovieDetails(movieID: movieID) { [weak self] result in
            switch result {
            case .success(let movie):
                self?.viewController?.updateView(with: movie)
            case .failure(let error):
                print("Error fetching movie details: \(error)")
            }
        }
    }
}
