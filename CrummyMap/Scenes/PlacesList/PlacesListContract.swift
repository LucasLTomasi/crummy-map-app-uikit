import UIKit

protocol PlacesListPresenterInput {
    func getPlaces(with text: String, completion: @escaping (Result<[Place], APIError>) -> Void)
    func navigateToPlaceDetail(place: Place, navigationController: UINavigationController?)
}

protocol PlacesListPresenterOutput: AnyObject {
    func updateNetworkConnectionAvailability(_ availability: NetworkConnectionAvailability)
}
