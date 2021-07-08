import MapKit
import UIKit

class PlaceDetailViewController: UIViewController {
    private let screen = PlacesDetailView()

    init(place: Place) {
        super.init(nibName: nil, bundle: nil)
        screen.formattedPlaceLabel.text = place.formatted
        let location = CLLocationCoordinate2D(latitude: place.geometry.latitude, longitude: place.geometry.longitude)
        setMapRegion(with: location)
        addAnnotation(with: location)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view = screen
        title = String.Localizable.placeDetailViewTitle
        navigationItem.largeTitleDisplayMode = .never
    }

    private func setMapRegion(with location: CLLocationCoordinate2D) {
        screen.mapView.setRegion(MKCoordinateRegion(center: location,
                                                    span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)), animated: true)
    }

    private func addAnnotation(with location: CLLocationCoordinate2D) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        screen.mapView.addAnnotation(annotation)
    }
}
