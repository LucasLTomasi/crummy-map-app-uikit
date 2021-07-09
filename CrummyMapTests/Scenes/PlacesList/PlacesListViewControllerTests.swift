@testable import CrummyMap
import MapKit
import XCTest

class PlacesListViewControllerTest: XCTestCase {
    var presenter: PlacesListPresenterMock!
    var sut: PlacesListViewController!

    override func setUp() {
        presenter = PlacesListPresenterMock()
        sut = PlacesListViewController(presenter: presenter)
    }

    override func tearDown() {
        presenter = nil
        sut = nil
    }

    func test_PlacesListViewController_viewDidLoad_shouldConfigureApproriateAppearance() {
        sut.viewDidLoad()

        XCTAssert(sut?.view is PlacesListView)
        XCTAssertEqual(sut?.title, String.Localizable.placesListViewTitle)
    }

    func test_PlacesListViewController_searchBarTextDidChange_shouldCallPresenterGetPlacesCallCount() {
        sut.searchBar(UISearchBar(), textDidChange: "search text")

        XCTAssertEqual(presenter.getPlacesCallCount, 1)
    }

    func test_PlacesListViewController_tableViewDidSelectRowAt_shouldCallPresenterNavigateToPlaceDetailCallCount() {
        sut.searchBar(UISearchBar(), textDidChange: "search text")
        sut.tableView(UITableView(), didSelectRowAt: IndexPath(row: 0, section: 0))

        XCTAssertEqual(presenter.navigateToPlaceDetailCallCount, 1)
    }
}
