import UIKit

final class NavBarViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.barTintColor = Resources.Colors.BaseView.background
        navigationBar.backgroundColor = Resources.Colors.BaseView.background
        configure()
    }

    func configure() {
        view.backgroundColor = Resources.Colors.BaseView.background
        navigationBar.isTranslucent = false
        navigationBar.standardAppearance.titleTextAttributes = [
            .foregroundColor: UIColor(.white)
        ]
    }
}
