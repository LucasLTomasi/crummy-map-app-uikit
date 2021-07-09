import UIKit

class PlacesListPresenter: PlacesListPresenterInput {
    private let debounceTime: Double = 1
    private let apiClient: APIClientProtocol
    private let coordinator: PlacesListCoordinator
    private weak var output: PlacesListPresenterOutput?
    private var getPlacesTask: DispatchWorkItem?

    init(coordinator: PlacesListCoordinator, apiClient: APIClientProtocol = APIClient.shared) {
        self.coordinator = coordinator
        self.apiClient = apiClient
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
        DispatchQueue.main.asyncAfter(deadline: .now() + debounceTime, execute: getPlacesTask)
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
