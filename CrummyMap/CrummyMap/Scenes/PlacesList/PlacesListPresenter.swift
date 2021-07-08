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
        apiClient.request(text: text) { response in
            switch response {
            case let .success(apiResponse):
                completion(.success(apiResponse.results))
            case let .failure(apiError):
                completion(.failure(apiError))
            }
        }
    }
}
