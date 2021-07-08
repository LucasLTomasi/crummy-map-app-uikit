import UIKit

class Coordinator {
    weak var appDelegate: AppDelegate?

    init(appDelegate: AppDelegate) {
        self.appDelegate = appDelegate
    }

    func start() {
        let placesListViewController = ViewControllerFactory.makePlacesListViewController(coordinator: self)
        let navigationController = UINavigationController(rootViewController: placesListViewController)
        navigationController.navigationBar.prefersLargeTitles = true
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = navigationController
        appDelegate?.window = window
        window.makeKeyAndVisible()
    }
}

extension Coordinator: PlacesListCoordinator {
    func pushPlaceDetail(place: Place, navigationController: UINavigationController?) {
        navigationController?.pushViewController(ViewControllerFactory.makePlaceDetailViewController(place: place), animated: true)
    }
}
