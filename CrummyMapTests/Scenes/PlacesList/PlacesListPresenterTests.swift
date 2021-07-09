@testable import CrummyMap
import XCTest

class PlacesListPresenterTests: XCTestCase {
    var coordinator: CoordinatorMock!
    var apiClient: APIClientMock!
    var sut: PlacesListPresenter!

    override func setUp() {
        coordinator = CoordinatorMock()
        apiClient = APIClientMock()
        sut = PlacesListPresenter(coordinator: coordinator, apiClient: apiClient)
    }

    override func tearDown() {
        coordinator = nil
        apiClient = nil
        sut = nil
    }

    func test_PlacesListPresenter_navigateToPlaceDetail_shouldReturnPlacesListViewController() {
        let place = PlaceFactory.makePlace()

        sut.navigateToPlaceDetail(place: place, navigationController: nil)

        XCTAssertEqual(coordinator.pushPlaceDetailCallCount, 1)
    }

    func test_PlacesListPresenter_getPlaces_withoutErrors_shouldReceiveSuccessWhenRequestIsCalledFromAPIClient() {
        let expectation = self.expectation(description: #function)
        var result: Result<[Place], APIError>?

        sut.getPlaces(with: "search text") { getPlacesResult in
            result = getPlacesResult
            expectation.fulfill()
        }

        waitForExpectations(timeout: 1.5)
        XCTAssertEqual(apiClient.requestCallCount, 1)
        XCTAssertEqual(result, .success([]))
    }

    func test_PlacesListPresenter_getPlaces_withDecodingError_shouldReceiveFailureWhenRequestIsCalledFromAPIClient() {
        let expectation = self.expectation(description: #function)
        var result: Result<[Place], APIError>?
        let error = APIError.decoding(description: "")
        apiClient.shouldFail = true
        apiClient.error = error

        sut.getPlaces(with: "search text") { getPlacesResult in
            result = getPlacesResult
            expectation.fulfill()
        }

        waitForExpectations(timeout: 1.5)
        XCTAssertEqual(apiClient.requestCallCount, 1)
        XCTAssertEqual(result, .failure(error))
    }

    func test_PlacesListPresenter_getPlaces_withNetworkingError_shouldReceiveFailureWhenRequestIsCalledFromAPIClient() {
        let expectation = self.expectation(description: #function)
        var result: Result<[Place], APIError>?
        let error = APIError.network(description: "")
        apiClient.shouldFail = true
        apiClient.error = error

        sut.getPlaces(with: "search text") { getPlacesResult in
            result = getPlacesResult
            expectation.fulfill()
        }

        waitForExpectations(timeout: 1.5)
        XCTAssertEqual(apiClient.requestCallCount, 1)
        XCTAssertEqual(result, .failure(error))
    }

    func test_PlacesListPresenter_getPlaces_withSuccessiveCallWhenNotEnoughTimeHasPassed_shouldCallRequestFromAPIClientOnlyOneTime() {
        let expectation = self.expectation(description: #function)
        var resultThatWillNotBeUpdated: Result<[Place], APIError>?
        var resultThatCancelledThePreviousRequest: Result<[Place], APIError>?

        sut.getPlaces(with: "this request will be canceled by the next") { getPlacesResult in
            resultThatWillNotBeUpdated = getPlacesResult
            XCTFail()
        }

        sut.getPlaces(with: "this request will execute its closure") { getPlacesResult in
            resultThatCancelledThePreviousRequest = getPlacesResult
            expectation.fulfill()
        }

        waitForExpectations(timeout: 1.5)
        XCTAssertEqual(apiClient.requestCallCount, 1)
        XCTAssertNil(resultThatWillNotBeUpdated)
        XCTAssertEqual(resultThatCancelledThePreviousRequest, .success([]))
    }

    func test_PlacesListPresenter_getPlaces_withSuccessiveCallWhenEnoughTimeHasPassed_shouldCallRequestFromAPIClientTwoTimes() {
        let expectation1 = self.expectation(description: #function)
        let expectation2 = self.expectation(description: #function)
        var result1: Result<[Place], APIError>?
        var result2: Result<[Place], APIError>?

        sut.getPlaces(with: "search text 1") { getPlacesResult in
            result1 = getPlacesResult
            expectation1.fulfill()
        }

        wait(for: [expectation1], timeout: 1.5)

        sut.getPlaces(with: "search text 2") { getPlacesResult in
            result2 = getPlacesResult
            expectation2.fulfill()
        }

        wait(for: [expectation2], timeout: 1.5)

        XCTAssertEqual(apiClient.requestCallCount, 2)
        XCTAssertEqual(result1, .success([]))
        XCTAssertEqual(result2, .success([]))
    }
}
