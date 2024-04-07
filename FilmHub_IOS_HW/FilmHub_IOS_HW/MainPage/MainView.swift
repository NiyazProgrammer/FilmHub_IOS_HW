import UIKit

class MainView: UIView {

    lazy var scrollView: UIScrollView = {

        var scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .gray
        scrollView.showsVerticalScrollIndicator = false
        // scrollView.alwaysBounceVertical = false
        scrollView.backgroundColor = UIColor(red: 31/255, green: 29/255, blue: 55/255, alpha: 1.0)

        return scrollView
    }()

    lazy var contentView: UIView = {

        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    lazy var avatarImageView: UIImageView = {

        var imageView = RoundImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .gray
        return imageView
    }()

    lazy var helloLabel: UILabel = {

        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hello!"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 28)

        return label
    }()

    lazy var hintLabel: UILabel = {

        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Review or track film you’ve watched..."
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)

        return label
    }()

    lazy var popularFilmsLabel: UILabel = {

        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Popular Films This Year"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)

        return label
    }()

    lazy var firstFilmImageView: UIImageView = {

        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .gray
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill

        return imageView
    }()

    lazy var secondFilmImageView: UIImageView = {

        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .gray
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill

        return imageView
    }()

    lazy var thirdFilmImageView: UIImageView = {

        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .gray
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill

        return imageView
    }()

    lazy var fourthFilmImageView: UIImageView = {

        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .gray
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill

        return imageView
    }()

    lazy var fifthFilmImageView: UIImageView = {

        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .gray
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill

        return imageView
    }()

    var popularFilmsStackView: UIStackView = {

        var stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.distribution = .fillEqually

        return stackView
    }()

    lazy var categoriesLabel: UILabel = {

        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Сategories"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)

        return label
    }()

    lazy var categoriesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 120, height: 120)
        layout.minimumLineSpacing = 0
        let table = UICollectionView(frame: .zero, collectionViewLayout: layout)
        table.showsHorizontalScrollIndicator = false
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(CategoriesCollectionViewCell.self, forCellWithReuseIdentifier: CategoriesCollectionViewCell.reuseIdentifier)
        table.backgroundColor = UIColor(red: 31/255, green: 29/255, blue: 55/255, alpha: 1.0)
        return table
    }()

    lazy var friendsReviewLabel: UILabel = {

        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Recent Friends’ Review"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)

        return label
    }()

    lazy var firstReviewView: ReviewView = {
        var view = ReviewView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.clipsToBounds = true

        return view
    }()

    lazy var secondReviewView: ReviewView = {
        var view = ReviewView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.clipsToBounds = true

        return view
    }()

    lazy var thirdReviewView: ReviewView = {
        var view = ReviewView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.clipsToBounds = true

        return view
    }()

    lazy var fourthReviewView: ReviewView = {
        var view = ReviewView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.clipsToBounds = true

        return view
    }()

    lazy var fifthReviewView: ReviewView = {
        var view = ReviewView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.clipsToBounds = true

        return view
    }()

    lazy var reviewsStackView: UIStackView = {

        var stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually

        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension MainView {

    func setUserName(with name: String) {

        let labelText = "Hello, " + name + "!"

        let attributedString = NSMutableAttributedString(string: labelText)
        attributedString.addAttribute(.foregroundColor, value: UIColor.white, range: NSRange(location: 0, length: 7))
        attributedString.addAttribute(.foregroundColor, value: UIColor(red: 233/255, green: 166/255, blue: 165/255, alpha: 1.0), range: NSRange(location: 7, length: name.count))
        attributedString.addAttribute(.foregroundColor, value: UIColor.white, range: NSRange(location: 7 + name.count , length: 1))

        helloLabel.attributedText = attributedString
    }

    func setRecentFriendsReview(with reviews: [Review]) {
        firstReviewView.configureView(with: reviews[0])
        secondReviewView.configureView(with: reviews[1])
        thirdReviewView.configureView(with: reviews[2])
        fourthReviewView.configureView(with: reviews[3])
        fifthReviewView.configureView(with: reviews[4])
    }

    func setupLayout() {

        popularFilmsStackView.addArrangedSubview(firstFilmImageView)
        popularFilmsStackView.addArrangedSubview(secondFilmImageView)
        popularFilmsStackView.addArrangedSubview(thirdFilmImageView)
        popularFilmsStackView.addArrangedSubview(fourthFilmImageView)
        popularFilmsStackView.addArrangedSubview(fifthFilmImageView)

        reviewsStackView.addArrangedSubview(firstReviewView)
        reviewsStackView.addArrangedSubview(secondReviewView)
        reviewsStackView.addArrangedSubview(thirdReviewView)
        reviewsStackView.addArrangedSubview(fourthReviewView)
        reviewsStackView.addArrangedSubview(fifthReviewView)

        for view in reviewsStackView.arrangedSubviews {
            NSLayoutConstraint.activate([
                view.heightAnchor.constraint(equalToConstant: 122)
            ])
        }

        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(avatarImageView)
        contentView.addSubview(helloLabel)
        contentView.addSubview(hintLabel)
        contentView.addSubview(popularFilmsLabel)
        contentView.addSubview(popularFilmsStackView)
        contentView.addSubview(categoriesLabel)
        contentView.addSubview(categoriesCollectionView)
        contentView.addSubview(friendsReviewLabel)
        contentView.addSubview(reviewsStackView)

        NSLayoutConstraint.activate([

            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),

            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            avatarImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 0),
            avatarImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            avatarImageView.heightAnchor.constraint(equalToConstant: 50),
            avatarImageView.widthAnchor.constraint(equalTo: avatarImageView.heightAnchor),

            helloLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            helloLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 20),

            hintLabel.leadingAnchor.constraint(equalTo: helloLabel.leadingAnchor),
            hintLabel.topAnchor.constraint(equalTo: helloLabel.bottomAnchor, constant: 5),

            popularFilmsLabel.leadingAnchor.constraint(equalTo: helloLabel.leadingAnchor),
            popularFilmsLabel.topAnchor.constraint(equalTo: hintLabel.bottomAnchor, constant: 30),

            popularFilmsStackView.leadingAnchor.constraint(equalTo: popularFilmsLabel.leadingAnchor),
            popularFilmsStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            popularFilmsStackView.topAnchor.constraint(equalTo: popularFilmsLabel.bottomAnchor, constant: 20),
            popularFilmsStackView.heightAnchor.constraint(equalToConstant: 100),

            categoriesLabel.leadingAnchor.constraint(equalTo: popularFilmsLabel.leadingAnchor),
            categoriesLabel.topAnchor.constraint(equalTo: popularFilmsStackView.bottomAnchor, constant: 36),

            categoriesCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            categoriesCollectionView.topAnchor.constraint(equalTo: categoriesLabel.bottomAnchor, constant: 20),
            categoriesCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            categoriesCollectionView.heightAnchor.constraint(equalToConstant: 130),

            friendsReviewLabel.leadingAnchor.constraint(equalTo: popularFilmsLabel.leadingAnchor),
            friendsReviewLabel.topAnchor.constraint(equalTo: categoriesCollectionView.bottomAnchor, constant: 50),

//            firstReviewView.leadingAnchor.constraint(equalTo: friendsReviewLabel.leadingAnchor),
//            firstReviewView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
//            firstReviewView.topAnchor.constraint(equalTo: friendsReviewLabel.bottomAnchor, constant: 36),
//            firstReviewView.heightAnchor.constraint(equalToConstant: 122),
            reviewsStackView.leadingAnchor.constraint(equalTo: friendsReviewLabel.leadingAnchor),
            reviewsStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            reviewsStackView.topAnchor.constraint(equalTo: friendsReviewLabel.bottomAnchor, constant: 36)
        ])

        let bottomSubviewBottomConstraint = NSLayoutConstraint(item: contentView, attribute: .bottom, relatedBy: .greaterThanOrEqual, toItem: fifthReviewView, attribute: .bottom, multiplier: 1.0, constant: 10)
        bottomSubviewBottomConstraint.priority = .defaultHigh
        bottomSubviewBottomConstraint.isActive = true
    }
}
