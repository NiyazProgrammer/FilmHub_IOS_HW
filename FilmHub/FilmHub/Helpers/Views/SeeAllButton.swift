import UIKit

class SeeAllButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    private func commonInit() {
        self.backgroundColor = UIColor.clear
        self.setTitle("Все", for: .normal)
        self.setTitleColor(Resources.Colors.BaseView.mainColorApp, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 14)
    }
}
