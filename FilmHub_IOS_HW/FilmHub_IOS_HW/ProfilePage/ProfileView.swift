import UIKit
import SnapKit

class ProfileView: UIView {

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .clear
        scrollView.showsVerticalScrollIndicator = false
        scrollView.backgroundColor = .clear
        return scrollView
    }()

    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .clear
        return contentView
    }()

    private lazy var headerImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "testFilm2"))

        image.backgroundColor = .gray
        return image
    }()

    private lazy var avatarImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "testDefaultAvatar"))
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 40
        image.clipsToBounds = true
        return image
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Steve Job"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.sizeToFit()
        return label
    }()

    private lazy var followers: UILabel = {
        let label = UILabel()
        label.text = "500 followers"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18)
        label.sizeToFit()
        return label
    }()

    private lazy var followings: UILabel = {
        let label = UILabel()
        label.text = "100 followings"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18)
        label.sizeToFit()
        return label
    }()

    private lazy var followersAndFollowingsSV: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [followers, followings])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        return stackView
    }()

    private lazy var totalFilmsSV: UIStackView = {
        let stackView = MainUsersInfoSVBuilder()
            .addNumberInfo(number: 450)
            .addTitleInfo(title: Resources.Strings.ProfileScreen.totalFilmsForSV)
            .build()
        return stackView
    }()

    private lazy var willBeFilmsSV: UIStackView = {
        let stackView = MainUsersInfoSVBuilder()
            .addNumberInfo(number: 4)
            .addTitleInfo(title: Resources.Strings.ProfileScreen.willBeFilmsForSV)
            .build()
        return stackView
    }()

    private lazy var reviewFilmsSV: UIStackView = {
        let stackView = MainUsersInfoSVBuilder()
            .addNumberInfo(number: 30)
            .addTitleInfo(title: Resources.Strings.ProfileScreen.reviewFilmsForSV)
            .build()
        return stackView
    }()

    private lazy var statistikMainSV: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [totalFilmsSV, willBeFilmsSV, reviewFilmsSV])
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        return stackView
    }()

    private lazy var favoriteFilmsLabel: UILabel = {
        let label = UILabel()
        label.text = Resources.Strings.ProfileScreen.favoriteFilmsLabel
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.sizeToFit()
        return label
    }()

    private lazy var headerFavoriteFilmsSV: UIStackView = {
        let action = UIAction { _ in
            // MARK:  Переход на любимы фильмы
        }
        let buttonSeeAll = SeeAllButton(type: .custom, primaryAction: action)
        let stackView = UIStackView(arrangedSubviews: [favoriteFilmsLabel, buttonSeeAll])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        return stackView
    }()

    lazy var cardsFavoriteFilmsSV: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()

    private lazy var recentlyFilmsLabel: UILabel = {
        let label = UILabel()
        label.text = Resources.Strings.ProfileScreen.recentlyFilmsLabel
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.sizeToFit()
        return label
    }()

    private lazy var separatorView: UIView = {
        let separator = UIView()
        separator.backgroundColor = .lightGray
        return separator
    }()

    private lazy var headerRecentlyFilmsSV: UIStackView = {
        let action = UIAction { _ in
            // MARK:  Переход на недавние фильмы
        }
        let buttonSeeAll = SeeAllButton(type: .custom, primaryAction: action)
        let stackView = UIStackView(arrangedSubviews: [recentlyFilmsLabel,buttonSeeAll])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        return stackView
    }()

    private lazy var recentlyReviewsLabel: UILabel = {
        let label = UILabel()
        label.text = Resources.Strings.ProfileScreen.recentlyReviewsLabel
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.sizeToFit()
        return label
    }()

    private lazy var headerRecentlyReviewsSV: UIStackView = {
        let action = UIAction { _ in
            // MARK:  Переход на недавние фильмы
        }
        let buttonSeeAll = SeeAllButton(type: .custom, primaryAction: action)
        let stackView = UIStackView(arrangedSubviews: [recentlyReviewsLabel,buttonSeeAll])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        return stackView
    }()

    lazy var recentlyFilmsColectionView: UICollectionView = {
        var wight = ((UIScreen.main.bounds.size.width) / 4) - 18

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 120, height: 180)

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.register(
            RecentlyFilmsCollectionViewCell.self,
            forCellWithReuseIdentifier: RecentlyFilmsCollectionViewCell.reuseIdentifier)
        return collectionView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        if let flowLayout = recentlyFilmsColectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.minimumInteritemSpacing = 0
            flowLayout.minimumLineSpacing = 0
            flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        addSubviews()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addSubviews() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(headerImage)
        contentView.addSubview(avatarImage)
        contentView.addSubview(nameLabel)
        contentView.addSubview(followersAndFollowingsSV)
        contentView.addSubview(statistikMainSV)
        contentView.addSubview(headerFavoriteFilmsSV)
        contentView.addSubview(cardsFavoriteFilmsSV)
        contentView.addSubview(headerRecentlyFilmsSV)
        addSubview(recentlyFilmsColectionView)
        contentView.addSubview(separatorView)
        contentView.addSubview(headerRecentlyReviewsSV)
    }

    private func setupLayout() {
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
            make.leading.trailing.equalTo(safeAreaLayoutGuide)
        }

        contentView.snp.makeConstraints { make in
            make.top.equalTo(scrollView.snp.top)
            make.leading.trailing.equalTo(scrollView)
            make.bottom.equalTo(scrollView.snp.bottom)
            make.width.equalTo(UIScreen.main.bounds.width)
        }

        headerImage.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top)
            make.leading.trailing.equalTo(contentView)
            make.height.equalTo(UIScreen.main.bounds.width / 2.5)
        }

        avatarImage.snp.makeConstraints { make in
            make.centerX.equalTo(contentView.snp.centerX)
            make.top.equalTo(headerImage.snp.bottom).offset(-40)
            make.width.equalTo(80)
            make.height.equalTo(80)
        }

        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(avatarImage.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }

        followersAndFollowingsSV.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.centerX.equalTo(contentView.snp.centerX)
        }

        statistikMainSV.snp.makeConstraints { make in
            make.top.equalTo(followersAndFollowingsSV.snp.bottom).offset(15)
            make.centerX.equalTo(contentView.snp.centerX)
        }

        headerFavoriteFilmsSV.snp.makeConstraints { make in
            make.top.equalTo(statistikMainSV.snp.bottom).offset(20)
            make.leading.equalTo(contentView.snp.leading).offset(15)
            make.trailing.equalTo(contentView.snp.trailing).offset(-15)
        }

        cardsFavoriteFilmsSV.snp.makeConstraints { make in
            make.top.equalTo(headerFavoriteFilmsSV.snp.bottom).offset(20)
            make.leading.equalTo(contentView.snp.leading).offset(20)
            make.trailing.equalTo(contentView.snp.trailing).offset(-20)
            make.height.equalTo(100)
        }

        separatorView.snp.makeConstraints { make in
            make.top.equalTo(cardsFavoriteFilmsSV.snp.bottom).offset(20)
            make.leading.trailing.equalTo(contentView)
            make.height.equalTo(0.5)
        }

        headerRecentlyFilmsSV.snp.makeConstraints { make in
            make.top.equalTo(separatorView.snp.bottom).offset(15)
            make.leading.equalTo(contentView.snp.leading).offset(15)
            make.trailing.equalTo(contentView.snp.trailing).offset(-15)
        }

        recentlyFilmsColectionView.snp.makeConstraints { make in
            make.top.equalTo(headerRecentlyFilmsSV.snp.bottom).offset(15)
            make.leading.trailing.equalTo(contentView)
            make.height.equalTo(150)
        }

        headerRecentlyReviewsSV.snp.makeConstraints { make in
            make.top.equalTo(recentlyFilmsColectionView.snp.bottom).offset(25)
            make.leading.equalTo(contentView.snp.leading).offset(15)
            make.trailing.equalTo(contentView.snp.trailing).offset(-15)
            make.bottom.equalTo(contentView.snp.bottom).offset(-15)
        }
    }
}
