import UIKit

class MainUsersInfoSVBuilder {
    private lazy var infoSV: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        return stackView
    }()

    func addNumberInfo(number: Int) -> Self {
        let numberLabel = UILabel()
        numberLabel.text = "\(number)"
        numberLabel.textColor = .white
        numberLabel.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        numberLabel.sizeToFit()
        infoSV.addArrangedSubview(numberLabel)
        return self
    }

    func addTitleInfo(title: String) -> Self {
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        titleLabel.sizeToFit()
        infoSV.addArrangedSubview(titleLabel)
        return self
    }

    func build() -> UIStackView {
        return infoSV
    }
}
