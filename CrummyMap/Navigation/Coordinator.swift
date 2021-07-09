import UIKit

class Coordinator {
    weak var appDelegate: AppDelegate?

    init(appDelegate: AppDelegate) {
        self.appDelegate = appDelegate
    }

    func start() {
        let placesListViewController = ViewControllerFactory.makePlacesListViewController(coordinator: self)
        let navigationController = UINavigationController(rootViewController: placesListViewController)
        setupNavigationBarAppearance(navigationController)
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = navigationController
        appDelegate?.window = window
        window.makeKeyAndVisible()
    }

    private func setupNavigationBarAppearance(_ navigationController: UINavigationController) {
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController.navigationBar.shadowImage = UIImage()
    }
}

extension Coordinator: PlacesListCoordinator {
    func pushPlaceDetail(place: Place, navigationController: UINavigationController?) {
        navigationController?.pushViewController(ViewControllerFactory.makePlaceDetailViewController(place: place), animated: true)
    }
}
