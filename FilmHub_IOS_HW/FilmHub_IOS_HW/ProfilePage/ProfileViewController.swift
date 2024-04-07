import UIKit

class ProfileViewController: BaseViewController {
    private var allMovies: [Movie] = []
    private var  favoriteMovies: [Movie] = []
    private let profileView: ProfileView = .init(frame: .zero)
    private let viewModel: ProfileViewModel

    init(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = profileView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
        setupBindings()

        profileView.recentlyFilmsColectionView.dataSource = self
        
        let recentFilmsId = viewModel.recentFilmsId
        let favoriteFilmsId = viewModel.favoriteFilmsId
        viewModel.loadUsersFilms(with: favoriteFilmsId, with: recentFilmsId)
    }

    private func setupNavigationBar() {
        navigationItem.title = "Profile"
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
    }

    private func addFavoriteMovies() {
        for index in 0..<favoriteMovies.count {
            let image = UIImageView(image: favoriteMovies[index].picture)
            image.contentMode = .scaleAspectFill
            image.layer.cornerRadius = 15
            image.clipsToBounds = true
            profileView.cardsFavoriteFilmsSV.addArrangedSubview(image)
        }
    }

    func setupBindings() {
        viewModel.getAllMovies = { [weak self] films in
            self?.allMovies = films
            self?.profileView.recentlyFilmsColectionView.reloadData()
        }

        viewModel.getFavoriteMovies = { [weak self] films in
            self?.favoriteMovies = films
            self?.addFavoriteMovies()
        }
    }
}

extension ProfileViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allMovies.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: RecentlyFilmsCollectionViewCell.reuseIdentifier,
            for: indexPath) as? RecentlyFilmsCollectionViewCell {
            let movie = allMovies[indexPath.row]
            cell.configure(imageFilm: movie.picture, rating: movie.rayting)
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
}
