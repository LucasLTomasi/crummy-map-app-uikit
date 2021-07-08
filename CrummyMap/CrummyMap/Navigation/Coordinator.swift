import UIKit

class Coordinator {
    weak var appDelegate: AppDelegate?

    init(appDelegate: AppDelegate) {
        self.appDelegate = appDelegate
    }

    func start() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = ViewControllerFactory.makePlacesListViewController(coordinator: self)
        appDelegate?.window = window
        window.makeKeyAndVisible()
    }
}

extension Coordinator: PlacesListCoordinator {}
