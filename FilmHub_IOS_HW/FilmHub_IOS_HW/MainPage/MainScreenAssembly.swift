import Foundation
import UIKit

class MainScreenAssembly {

    private init() { }

    static func buildMainScreen() -> UIViewController{

        let viewModel = MainViewModel(filmsAPIManager: KinoPoiskAPIManager())

        let viewController = MainViewController(mainViewModel: viewModel)

        return viewController
    }
}
