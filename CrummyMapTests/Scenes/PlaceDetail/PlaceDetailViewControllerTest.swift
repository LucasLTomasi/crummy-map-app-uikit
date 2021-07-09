@testable import CrummyMap
import MapKit
import XCTest

class PlaceDetailViewControllerTest: XCTestCase {
    var sut: PlaceDetailViewController!

    func test_PlaceDetailViewController_viewDidLoad_shouldConfigureApproriateAppearanceIncludingMapElements() {
        let place = PlaceFactory.makePlace()

        sut = PlaceDetailViewController(place: place)
        sut.viewDidLoad()

        XCTAssert(sut?.view is PlacesDetailView)
        XCTAssertEqual(sut?.title, String.Localizable.placeDetailViewTitle)
        XCTAssertEqual(sut?.navigationItem.largeTitleDisplayMode, .never)
        XCTAssertNotNil((sut?.view as? PlacesDetailView)?.mapView.region)
        XCTAssert((sut?.view as? PlacesDetailView)?.mapView.annotations.isEmpty == false)
    }
}
