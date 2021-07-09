@testable import CrummyMap
import UIKit

class CoordinatorMock {
    var pushPlaceDetailCallCount = 0
}

extension CoordinatorMock: PlacesListCoordinator {
    func pushPlaceDetail(place: Place, navigationController: UINavigationController?) {
        pushPlaceDetailCallCount += 1
    }
}
