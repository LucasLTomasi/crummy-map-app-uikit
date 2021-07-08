import UIKit

class PlacesListPresenter: PlacesListPresenterInput {
    private let apiClient = APIClient.shared
    private let coordinator: PlacesListCoordinator
    private weak var output: PlacesListPresenterOutput?

    init(coordinator: PlacesListCoordinator) {
        self.coordinator = coordinator
    }

    func attach(output: PlacesListPresenterOutput) {
        self.output = output
    }

    func getPlaces(with text: String, completion: @escaping (Result<[Place], APIError>) -> Void) {
        apiClient.request(text: text) { result in
            switch result {
            case let .success(apiResponse):
                completion(.success(apiResponse.results))
            case let .failure(apiError):
                completion(.failure(apiError))
            }
        }
    }

    func navigateToPlaceDetail(place: Place, navigationController: UINavigationController?) {
        coordinator.pushPlaceDetail(place: place, navigationController: navigationController)
    }
}
