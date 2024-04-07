import UIKit
import Kingfisher

class ReviewView: UIView {

    lazy var avatarImageView: UIImageView = {

        var imageView = RoundImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .gray
        return imageView
    }()

    lazy var filmTitleLabel: UILabel = {

        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Noname"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)

        return label
    }()

    lazy var filmYearLabel: UILabel = {

        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "NoYear"
        label.textColor = UIColor(red: 149/255, green: 145/255, blue: 157/255, alpha: 1.0)
        label.font = UIFont.systemFont(ofSize: 10, weight: .semibold)

        return label
    }()

    lazy var reviewByLabel: UILabel = {

        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Review by NoName"
        label.textColor = UIColor(red: 149/255, green: 145/255, blue: 157/255, alpha: 1.0)
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)

        return label
    }()

    lazy var rating: UIStackView = {
        var stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()

    lazy var descriptionLabel: UILabel = {

        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Mock Mock Mock Mock Mock Mock Mock Mock Mock Mock Mock Mock Mock Mock Mock Mock Mock Mock Mock Mock Mock Mock Mock Mock Mock Mock Mock Mock Mock Mock Mock Mock Mock Mock Mock Mock Mock Mock Mock Mock Mock Mock Mock Mock"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 11)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping

        return label
    }()

    lazy var filmImageView: UIImageView = {

        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .gray
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill

        return imageView
    }()

    lazy var readMoreLabel: UILabel = {

        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Read more >"
        label.textColor = UIColor(red: 159/255, green: 80/255, blue: 142/255, alpha: 1.0)
        label.font = UIFont.systemFont(ofSize: 11, weight: .semibold)

        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ReviewView {

    func configureView(with review: Review) {
        filmTitleLabel.text = review.filmTitle
        filmYearLabel.text = String(review.filmYear)
        reviewByLabel.text = review.reviewerName
        descriptionLabel.text = review.description
        filmImageView.kf.setImage(with: review.filmImage)
        configureRating(with: review.rating)
    }

    private func configureRating(with estimation: FilmEstimation) {
        switch estimation {
        case FilmEstimation.Positive:
            rating = StarsBuilder().addStar().addStar().addStar().addStar().addStar()   .buildStars(withStarsSize: 8)
        case FilmEstimation.Neutral:
            rating = StarsBuilder().addStar().addStar().addHalfStar()   .buildStars(withStarsSize: 8)
        case FilmEstimation.Negative:
            rating = StarsBuilder().addStar()
                .buildStars(withStarsSize: 8)
        }

        rating.translatesAutoresizingMaskIntoConstraints = false
    }

    func setupLayout() {

        backgroundColor = UIColor(red: 41/255, green: 36/255, blue: 60/255, alpha: 1.0)

        addSubview(avatarImageView)
        addSubview(filmTitleLabel)
        addSubview(filmYearLabel)
        addSubview(reviewByLabel)
        addSubview(rating)
        addSubview(descriptionLabel)
        addSubview(filmImageView)
        addSubview(readMoreLabel)

        NSLayoutConstraint.activate([
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            avatarImageView.topAnchor.constraint(equalTo: topAnchor),
            avatarImageView.heightAnchor.constraint(equalToConstant: 40),
            avatarImageView.widthAnchor.constraint(equalTo: avatarImageView.heightAnchor),

            filmTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            filmTitleLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 10),

            filmYearLabel.leadingAnchor.constraint(equalTo: filmTitleLabel.trailingAnchor, constant: 2),
            filmYearLabel.bottomAnchor.constraint(equalTo: filmTitleLabel.bottomAnchor),

            reviewByLabel.leadingAnchor.constraint(equalTo: filmTitleLabel.leadingAnchor),
            reviewByLabel.topAnchor.constraint(equalTo: filmTitleLabel.bottomAnchor, constant: 5),

            rating.leadingAnchor.constraint(equalTo: reviewByLabel.trailingAnchor, constant: 3),
            rating.centerYAnchor.constraint(equalTo: reviewByLabel.centerYAnchor),

            filmImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            filmImageView.topAnchor.constraint(equalTo: topAnchor),
            filmImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            filmImageView.widthAnchor.constraint(equalToConstant: 80),

            descriptionLabel.leadingAnchor.constraint(equalTo: filmTitleLabel.leadingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: reviewByLabel.bottomAnchor, constant: 5),
            descriptionLabel.trailingAnchor.constraint(equalTo: filmImageView.leadingAnchor, constant: -20),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -18),

            readMoreLabel.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor),
            readMoreLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 1)
        ])
    }
}
