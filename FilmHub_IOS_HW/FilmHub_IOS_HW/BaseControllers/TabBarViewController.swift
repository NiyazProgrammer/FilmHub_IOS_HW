import UIKit

enum Tabs: Int {
    case mainScreen
    case profileScreen
}

class TabBarViewController: UITabBarController {

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        tabBar.backgroundColor = Resources.Colors.BaseView.background
        tabBar.barTintColor = Resources.Colors.BaseView.background
        tabBar.tintColor = Resources.Colors.TabBar.active





        setViewControllers([

        ], animated: false)
    }
}
