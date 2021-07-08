import UIKit

class PlaceDetailViewController: UIViewController {
    private let screen = PlacesDetailView()

    init(place: Place) {
        super.init(nibName: nil, bundle: nil)
        screen.formattedPlaceLabel.text = place.formatted
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
}
