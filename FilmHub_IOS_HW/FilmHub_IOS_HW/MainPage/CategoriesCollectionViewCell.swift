import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {

    lazy var categoryImageView: UIImageView = {

        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .gray
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill

        return imageView
    }()

    lazy var categoryNameLabel: UILabel = {

        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 233/255, green: 166/255, blue: 165/255, alpha: 1.0)
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.text = "NoTitle"

        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupLayout()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        categoryImageView.image = nil
    }
}

extension CategoriesCollectionViewCell {

    func setupLayout() {

        addSubview(categoryImageView)
        addSubview(categoryNameLabel)

        NSLayoutConstraint.activate([
            categoryImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            categoryImageView.topAnchor.constraint(equalTo: topAnchor),
            categoryImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            categoryImageView.heightAnchor.constraint(equalToConstant: 100),

            categoryNameLabel.leadingAnchor.constraint(equalTo: categoryImageView.leadingAnchor),
            categoryNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    func configureCell(with categoryCellModel: CategoryCellModel) {
        categoryImageView.image = categoryCellModel.image
        categoryNameLabel.text = categoryCellModel.name
    }
}

extension UICollectionViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
