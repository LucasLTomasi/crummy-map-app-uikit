enum ViewControllerFactory {
    static func makePlacesListViewController(coordinator: PlacesListCoordinator) -> PlacesListViewController {
        let presenter = PlacesListPresenter(coordinator: coordinator)
        let controller = PlacesListViewController(presenter: presenter)
        presenter.attach(output: controller)
        return controller
    }

    static func makePlaceDetailViewController(place: Place) -> PlaceDetailViewController {
        PlaceDetailViewController(place: place)
    }
}
