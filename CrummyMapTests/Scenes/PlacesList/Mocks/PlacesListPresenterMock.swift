@testable import CrummyMap
import UIKit

class PlacesListPresenterMock: PlacesListPresenterInput {
    var getPlacesCallCount = 0
    var navigateToPlaceDetailCallCount = 0

    func getPlaces(with text: String, completion: @escaping (Result<[Place], APIError>) -> Void) {
        getPlacesCallCount += 1
        completion(.success([PlaceFactory.makePlace()]))
    }

    func navigateToPlaceDetail(place: Place, navigationController: UINavigationController?) {
        navigateToPlaceDetailCallCount += 1
    }
}
