import UIKit

enum Resources {
    enum Colors {

        enum TabBar {
            static let active = UIColor(hexString: "#EA9696")
            static let inactive: UIColor = .gray
        }
        
        enum BaseView {
            static let background = UIColor(hexString: "#1F1D36")
            static let mainColorApp = UIColor(hexString: "#E9A6A6")
        }
    }

    enum Images {
        enum TabBar {
            static let homePage = UIImage(named: "homePage")
            static let profilePage = UIImage(named: "profilePage")
        }
    }

    enum Strings {
        enum TabBar {
            static var mainScreen = "Главная"
            static let profileScreen = "Профиль"
        }

        enum ProfileScreen {
            static var recentlyFilmsLabel = "Recent"
            static var recentlyReviewsLabel = "Recent films"
            static var favoriteFilmsLabel = "Favorite films"
            static var reviewFilmsForSV = "Reviews"
            static var willBeFilmsForSV = "Will watch"
            static var totalFilmsForSV = "Total Films"
        }
    }
}
