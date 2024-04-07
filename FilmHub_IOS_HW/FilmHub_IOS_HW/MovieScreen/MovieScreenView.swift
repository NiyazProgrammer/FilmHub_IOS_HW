import UIKit


class MovieScreenView: UIView {
    
    var movieScreenViewController: MovieScreenViewController?
    var rateButtonAction: (() -> Void)?
    var movieAboutButtonAction: (() -> Void)?


    lazy var moviePhotoBackground: UIImageView = UIImageView()
    lazy var movieMainPhoto: UIImageView = UIImageView()
    lazy var infoHorizontalStackView: UIStackView = UIStackView()
    lazy var movieTitle: UILabel = UILabel()
    lazy var movieYearTitle: UILabel = UILabel()
    lazy var movieDirectorTitle: UILabel = UILabel()
    lazy var HorizontalStackViewButtons: UIStackView = UIStackView()
    lazy var rateTheFilmButton: UIButton = UIButton()
    lazy var rateTheFilmButtonLabel: UILabel = UILabel()
    lazy var willWatchButton: UIButton = UIButton()
    lazy var willWatchButtonLabel: UILabel = UILabel()
    lazy var movieAboutButton: UIButton = UIButton()
    lazy var movieAboutButtonLabel: UILabel = UILabel()
    lazy var descriptionStackView: UIStackView = UIStackView()
    lazy var movieDescriptionLabel: UILabel = UILabel()
    lazy var movieDetailsButton: UIButton = UIButton()
    lazy var ratingStackView: UIStackView = UIStackView()
    lazy var ratingLabel: UILabel = UILabel()
    lazy var scoreRatingLabel: UILabel = UILabel()
    lazy var scoreRatingButton: UIButton = UIButton()


    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(hexString: "#1F1D36")
        setUp()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUp() {
        setUpMoviePhotoBackground()
        setUpMovieMainPhoto()
        setUpInfoHorizontalStackView()
        setUpMovieDirectorTitle()
        setUpRateTheFilmButton()
        setUpmovieAboutButton()
        setUpWillWatchButton()
        setUpRatingLabel()
        setUpScoreRatingLabel()
        setUpScoreRatingButton()
        setUpWillWatchButtonLabel()
        setUprateTheFilmButtonLabel()
        setUpMovieAboutButtonLabel()
        setUpMovieDescriptionLabel()
        setUpMovieDetailsButton()

    }

    private func setUpMoviePhotoBackground() {
        addSubview(moviePhotoBackground)
        moviePhotoBackground.translatesAutoresizingMaskIntoConstraints = false
        moviePhotoBackground.image = UIImage(named: "daniel-olah-wfQaZHGAVHo")

        NSLayoutConstraint.activate([
            moviePhotoBackground.topAnchor.constraint(equalTo: topAnchor),
            moviePhotoBackground.leadingAnchor.constraint(equalTo: leadingAnchor),
            moviePhotoBackground.trailingAnchor.constraint(equalTo: trailingAnchor),
            moviePhotoBackground.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.35)
        ])
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setupGradient(in: moviePhotoBackground)
    }

    private func setupGradient(in view: UIView) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds

        let gradientHeight = view.bounds.height
        gradientLayer.frame.size.height = gradientHeight

        gradientLayer.colors = [UIColor.clear.cgColor, UIColor(hexString: "#1F1D36").withAlphaComponent(3).cgColor]
        gradientLayer.locations = [0.0001, 1]
        gradientLayer.zPosition = 100

        view.layer.insertSublayer(gradientLayer, at: 0)
    }

    private func setUpMovieMainPhoto() {
        addSubview(movieMainPhoto)
        movieMainPhoto.translatesAutoresizingMaskIntoConstraints = false
        movieMainPhoto.image = UIImage(named: "batmanPoster.jpeg")
        movieMainPhoto.layer.cornerRadius = 10
        movieMainPhoto.clipsToBounds = true

        // Установка constraints
        NSLayoutConstraint.activate([
            movieMainPhoto.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            movieMainPhoto.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -170),
            movieMainPhoto.widthAnchor.constraint(equalToConstant: 126),
            movieMainPhoto.heightAnchor.constraint(equalToConstant: 186)
        ])
    }



    //
    private func setUpInfoHorizontalStackView() {
        infoHorizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        infoHorizontalStackView.axis = .horizontal
        infoHorizontalStackView.distribution = .fill
        infoHorizontalStackView.spacing = 8

        setUpMovieTitle()
        setUpMovieYearTitle()

        infoHorizontalStackView.addArrangedSubview(movieTitle)
        infoHorizontalStackView.addArrangedSubview(movieYearTitle)


        addSubview(infoHorizontalStackView)

        NSLayoutConstraint.activate([
            infoHorizontalStackView.topAnchor.constraint(equalTo: moviePhotoBackground.bottomAnchor, constant: -70),
            infoHorizontalStackView.leadingAnchor.constraint(equalTo: movieMainPhoto.trailingAnchor, constant: 15),
            infoHorizontalStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])

    }

    private func setUpMovieTitle() {
        movieTitle.translatesAutoresizingMaskIntoConstraints = false
        movieTitle.text = "Batman"
        movieTitle.font = UIFont(name: "HelveticaNeue-Bold", size: 30)
        movieTitle.textColor = .white
    }

    private func setUpMovieYearTitle() {
        movieYearTitle.translatesAutoresizingMaskIntoConstraints = false
        movieYearTitle.text = "2022"
        movieYearTitle.textColor = .white
        movieYearTitle.font = UIFont.systemFont(ofSize: 14)
    }

    private func setUpMovieDirectorTitle() {
        addSubview(movieDirectorTitle)
        movieDirectorTitle.translatesAutoresizingMaskIntoConstraints = false
        movieDirectorTitle.numberOfLines = 0
        movieDirectorTitle.textColor = .white
        movieDirectorTitle.font = UIFont.systemFont(ofSize: 12)
        movieDirectorTitle.text = "Directed by Matt Reeves"

        NSLayoutConstraint.activate([
            movieDirectorTitle.topAnchor.constraint(equalTo: infoHorizontalStackView.bottomAnchor, constant: 8),
            movieDirectorTitle.leadingAnchor.constraint(equalTo: movieMainPhoto.trailingAnchor, constant: 15)

        ])
    }

    private func setUpRateTheFilmButton() {
        addSubview(rateTheFilmButton)
        let buttonImage = UIImage(systemName: "plus.rectangle.on.rectangle")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 30, weight: .regular))
        let tintedImage = buttonImage?.withTintColor(UIColor(hexString: "#EA9696"), renderingMode: .alwaysOriginal)
        rateTheFilmButton.setImage(tintedImage, for: .normal)
        rateTheFilmButton.contentVerticalAlignment = .center

        rateTheFilmButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rateTheFilmButton.topAnchor.constraint(equalTo: movieDirectorTitle.bottomAnchor, constant: 10),
            rateTheFilmButton.leadingAnchor.constraint(equalTo: movieMainPhoto.trailingAnchor, constant: 15),
            rateTheFilmButton.widthAnchor.constraint(equalToConstant: 70),
            rateTheFilmButton.heightAnchor.constraint(equalToConstant: 50)
        ])

        rateTheFilmButton.addTarget(self, action: #selector(rateButtonTapped), for: .touchUpInside)

    }

    @objc private func rateButtonTapped() {

            rateButtonAction?()
        }

    
    private func setUpWillWatchButton() {
        addSubview(willWatchButton)
        let buttonImage = UIImage(systemName: "list.star")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 30, weight: .regular))
        let tintedImage = buttonImage?.withTintColor(UIColor(hexString: "#EA9696"), renderingMode: .alwaysOriginal)
        willWatchButton.setImage(tintedImage, for: .normal)
        willWatchButton.contentVerticalAlignment = .center

        willWatchButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            willWatchButton.topAnchor.constraint(equalTo: movieDirectorTitle.bottomAnchor, constant: 10),
            willWatchButton.leadingAnchor.constraint(equalTo: rateTheFilmButton.trailingAnchor, constant: 20),
            willWatchButton.widthAnchor.constraint(equalToConstant: 60),
            willWatchButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    private func setUpmovieAboutButton() {
        addSubview(movieAboutButton)
        let buttonImage = UIImage(systemName: "info.square.fill")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 30, weight: .regular))
        let tintedImage = buttonImage?.withTintColor(UIColor(hexString: "#EA9696"), renderingMode: .alwaysOriginal)
        movieAboutButton.setImage(tintedImage, for: .normal)
        movieAboutButton.contentVerticalAlignment = .center

        movieAboutButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            movieAboutButton.topAnchor.constraint(equalTo: movieDirectorTitle.bottomAnchor, constant: 10),
            movieAboutButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            movieAboutButton.widthAnchor.constraint(equalToConstant: 60),
            movieAboutButton.heightAnchor.constraint(equalToConstant: 50)
        ])

        movieAboutButton.addTarget(self, action: #selector(movieAboutButtonTapped), for: .touchUpInside)

    }

    @objc private func movieAboutButtonTapped() {

            movieAboutButtonAction?()
        }

    private func setUprateTheFilmButtonLabel() {
        addSubview(rateTheFilmButtonLabel)
        rateTheFilmButtonLabel.translatesAutoresizingMaskIntoConstraints = false
        rateTheFilmButtonLabel.text = "Оценить фильм"
        rateTheFilmButtonLabel.textColor = UIColor(hexString: "#EA9696")
        rateTheFilmButtonLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 9)

        NSLayoutConstraint.activate([
            rateTheFilmButtonLabel.centerXAnchor.constraint(equalTo: rateTheFilmButton.centerXAnchor),
            rateTheFilmButtonLabel.topAnchor.constraint(equalTo: rateTheFilmButton.bottomAnchor, constant: 1)

        ])
    }

    private func setUpWillWatchButtonLabel() {
        addSubview(willWatchButtonLabel)
        willWatchButtonLabel.translatesAutoresizingMaskIntoConstraints = false
        willWatchButtonLabel.text = "Буду смотреть"
        willWatchButtonLabel.textColor = UIColor(hexString: "#EA9696")
        willWatchButtonLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 9)

        NSLayoutConstraint.activate([
            willWatchButtonLabel.centerXAnchor.constraint(equalTo: willWatchButton.centerXAnchor),
            willWatchButtonLabel.topAnchor.constraint(equalTo: willWatchButton.bottomAnchor, constant: 1)

        ])
    }

    private func setUpMovieAboutButtonLabel() {
        addSubview(movieAboutButtonLabel)
        movieAboutButtonLabel.translatesAutoresizingMaskIntoConstraints = false
        movieAboutButtonLabel.text = "О фильме"
        movieAboutButtonLabel.textColor = UIColor(hexString: "#EA9696")
        movieAboutButtonLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 9)

        NSLayoutConstraint.activate([
            movieAboutButtonLabel.centerXAnchor.constraint(equalTo: movieAboutButton.centerXAnchor),
            movieAboutButtonLabel.topAnchor.constraint(equalTo: movieAboutButton.bottomAnchor, constant: 1)

        ])
    }

    private func setUpMovieDescriptionLabel() {
        addSubview(movieDescriptionLabel)
        movieDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        movieDescriptionLabel.textColor = .white
        movieDescriptionLabel.font = UIFont(name: "HelveticaNeue", size: 10)
        movieDescriptionLabel.text = "UNMASK THE TRUTH.\n \nIn his second year of fighting crime, Batman uncovers corruption in Gotham City that connects to his own family while facing a serial killer known as the Riddler.\nUNMASK THE TRUTH.\nIn his second year of fighting crime, Batman uncovers corruption in Gotham City that connects to his own family while facing a serial killer known as the Riddler."
        movieDescriptionLabel.numberOfLines = 0
        movieDescriptionLabel.textAlignment = .justified // Выравнивание текста по левому краю

        NSLayoutConstraint.activate([
            movieDescriptionLabel.topAnchor.constraint(equalTo: willWatchButtonLabel.bottomAnchor, constant: 20),
            movieDescriptionLabel.leadingAnchor.constraint(equalTo: ratingLabel.trailingAnchor, constant: 45),
            movieDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            movieDescriptionLabel.heightAnchor.constraint(equalToConstant: 90)


        ])
    }

    private func setUpMovieDetailsButton() {
        addSubview(movieDetailsButton)

        movieDetailsButton.setTitle("Все детали о фильме", for: .normal)
        movieDetailsButton.setTitleColor(UIColor(hexString: "#EA9696"), for: .normal)
        movieDetailsButton.backgroundColor = .clear
        movieDetailsButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 15)
        movieDetailsButton.layer.borderWidth = 0
        movieDetailsButton.layer.borderColor = UIColor.clear.cgColor

        movieDetailsButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            movieDetailsButton.topAnchor.constraint(equalTo: movieDescriptionLabel.bottomAnchor, constant: 5),
            movieDetailsButton.centerXAnchor.constraint(equalTo: movieDescriptionLabel.centerXAnchor)
        ])
    }



    //
    private func setUpRatingStackView() {
        ratingStackView.addArrangedSubview(ratingLabel)
    }

    private func setUpRatingLabel() {
        addSubview(ratingLabel)
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.text = "Rating"
        ratingLabel.font = UIFont(name: "HelveticaNeue", size: 22)
        ratingLabel.textColor = .darkGray

        NSLayoutConstraint.activate([
            ratingLabel.topAnchor.constraint(equalTo: movieMainPhoto.bottomAnchor, constant: 15),

            ratingLabel.centerXAnchor.constraint(equalTo: movieMainPhoto.centerXAnchor)

        ])

    }

    private func setUpScoreRatingLabel() {
        addSubview(scoreRatingLabel)
        scoreRatingLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreRatingLabel.font = UIFont(name: "HelveticaNeue-bold", size: 42)
        scoreRatingLabel.text = "4.3"
        scoreRatingLabel.textColor = UIColor(hexString: "#EA9696")

        NSLayoutConstraint.activate([
            scoreRatingLabel.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor, constant: 15),
            scoreRatingLabel.centerXAnchor.constraint(equalTo: ratingLabel.centerXAnchor)
        ])

    }

    private func setUpScoreRatingButton() {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)

        let starButtons = (1...5).map { _ in
            let button = UIButton(type: .system)
            button.tintColor = .systemYellow
            let starImage = UIImage(systemName: "star")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 13))
            button.setImage(starImage, for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }

        starButtons.forEach { button in
            stackView.addArrangedSubview(button)
            button.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 1.0 / CGFloat(starButtons.count)).isActive = true
        }

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scoreRatingLabel.bottomAnchor, constant: 16),
            stackView.centerXAnchor.constraint(equalTo: movieMainPhoto.centerXAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    
}

