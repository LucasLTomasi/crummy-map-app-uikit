import UIKit

class PlacesListPresenter: PlacesListPresenterInput {
    private let apiClient = APIClient.shared
    private let coordinator: PlacesListCoordinator
    private weak var output: PlacesListPresenterOutput?
    private var getPlacesTask: DispatchWorkItem?

    init(coordinator: PlacesListCoordinator) {
        self.coordinator = coordinator
        observeNetworkConnectionAvailability()
    }

    func attach(output: PlacesListPresenterOutput) {
        self.output = output
    }

    func getPlaces(with text: String, completion: @escaping (Result<[Place], APIError>) -> Void) {
        getPlacesTask?.cancel()
        getPlacesTask = DispatchWorkItem { [weak self] in
            DispatchQueue.global(qos: .userInteractive).async { [weak self] in
                self?.apiClient.request(text: text) { result in
                    switch result {
                    case let .success(apiResponse):
                        completion(.success(apiResponse.results))
                    case let .failure(apiError):
                        completion(.failure(apiError))
                    }
                }
            }
        }
        guard let getPlacesTask = getPlacesTask else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: getPlacesTask)
    }

    func navigateToPlaceDetail(place: Place, navigationController: UINavigationController?) {
        coordinator.pushPlaceDetail(place: place, navigationController: navigationController)
    }

    private func observeNetworkConnectionAvailability() {
        NetworkConnectionManager.shared.observe { availability in
            self.output?.updateNetworkConnectionAvailability(availability)
        }
    }
}
