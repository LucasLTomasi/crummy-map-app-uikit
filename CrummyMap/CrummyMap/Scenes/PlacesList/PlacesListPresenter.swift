class PlacesListPresenter: PlacesListPresenterInput {
    private let coordinator: PlacesListCoordinator
    private weak var output: PlacesListPresenterOutput?

    init(coordinator: PlacesListCoordinator) {
        self.coordinator = coordinator
    }

    func attach(output: PlacesListPresenterOutput) {
        self.output = output
    }
}
