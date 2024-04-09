import UIKit
import Kingfisher
import Combine

class MainViewController: UIViewController {

    private var mainViewModel: MainViewModel
    private let mainView: MainView = MainView()
    private var cancellables: Set<AnyCancellable> = []

    init(mainViewModel: MainViewModel) {
        self.mainViewModel = mainViewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let categoriesDataSource: [CategoryCellModel] = [
        CategoryCellModel(image: UIImage(named: "comedy") ?? UIImage(), name: "Comedy"),
        CategoryCellModel(image: UIImage(named: "horror") ?? UIImage(), name: "Horror"),
        CategoryCellModel(image: UIImage(named: "drama") ?? UIImage(), name: "Drama"),
        CategoryCellModel(image: UIImage(named: "thriller") ?? UIImage(), name: "Thriller"),
        CategoryCellModel(image: UIImage(named: "action") ?? UIImage(), name: "Action"),
        CategoryCellModel(image: UIImage(named: "fantasy") ?? UIImage(), name: "Fantasy"),
        CategoryCellModel(image: UIImage(named: "adventure") ?? UIImage(), name: "Adventure"),
        CategoryCellModel(image: UIImage(named: "romance") ?? UIImage(), name: "Romance"),
        CategoryCellModel(image: UIImage(named: "crime") ?? UIImage(), name: "Crime"),
    ]

    override func loadView() {
        view = mainView
        mainView.categoriesCollectionView.dataSource = self
        mainView.categoriesCollectionView.delegate = self
        mainView.setUserName(with: "Azat")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.setNavigationBarHidden(true, animated: false)
        setupBindings()
        Task {
            await mainViewModel.getReviews()
            await mainViewModel.getPopularFilmsImages()
        }
    }
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func setupBindings() {
        mainViewModel.$popularFilmsImages
            .dropFirst()
            .sink { [weak self] images in
                self?.mainView.setPopularFilmsImages(with: images)
            }
            .store(in: &cancellables)

        mainViewModel.$recentReviews
            .dropFirst()
            .sink { [weak self] reviews in
                self?.mainView.setRecentFriendsReview(with: reviews)
            }
            .store(in: &cancellables)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categoriesDataSource.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CategoriesCollectionViewCell.reuseIdentifier,
            for: indexPath) as? CategoriesCollectionViewCell else {
            return UICollectionViewCell()
        }

        cell.configureCell(with: categoriesDataSource[indexPath.row])

        return cell
    }

//    func collectionView(
//        _ collectionView: UICollectionView,
//        layout collectionViewLayout: UICollectionViewLayout,
//        sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 150, height: 155)
//    }

}
