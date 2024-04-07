import UIKit


/// For Profile screen
class RecentlyFilmsCollectionViewCell: UICollectionViewCell {

    private lazy var filmImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius =  20
        image.clipsToBounds = true
        return image
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)


        contentView.addSubview(filmImage)
        
        setupLayout()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {
        filmImage.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(20)
            make.leading.equalTo(contentView.snp.leading).offset(10)
            make.trailing.equalTo(contentView.snp.trailing).offset(-10)
            make.width.equalTo(60)
            make.height.equalTo(110)
        }

    }

    func configure(imageFilm: UIImage, rating: Double) {
        filmImage.image = imageFilm

        createStarsSV(rating: rating)
    }

    private func createStarsSV(rating: Double) {
        var stackView = StarsBuilder()

        let fullStarCount = Int(rating)
        let hasHalfStar = rating.truncatingRemainder(dividingBy: 1) >= 0.5

        // MARK: Добавляем полные звезды
        for _ in 0..<fullStarCount {
            stackView = stackView.addStar()
        }

        // MARK: Добавляем половинную звезду, если необходимо
        if hasHalfStar {
            stackView = stackView.addHalfStar()
        }

        let starsStackView = stackView.buildStars(withStarsSize: 10)
        contentView.addSubview(starsStackView)

        starsStackView.snp.makeConstraints { make in
            make.top.equalTo(filmImage.snp.bottom).offset(15)
            make.leading.equalTo(contentView.snp.leading).offset(10)
        }
    }
}

extension RecentlyFilmsCollectionViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
