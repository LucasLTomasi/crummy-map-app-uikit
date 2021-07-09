import XCTest

class CrummyMapUITests: XCTestCase {
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testVariousBehaviors() {
        let app = XCUIApplication()
        app.launch()

        // Static texts
        let placesListViewTitle = app.staticTexts["Find a place"]
        let cancelButton = app.staticTexts["Cancel"]
        let placesListViewPlaceholderText = app.staticTexts["Type something\non the search bar"]
        let placesListViewLoading = app.staticTexts["Loading..."]

        // Search bar
        let searchSearchField = app.searchFields["Search"]

        // Idle
        XCTAssert(placesListViewTitle.exists)
        XCTAssert(placesListViewPlaceholderText.exists)

        // Tap search bar
        searchSearchField.tap()
        XCTAssert(app.keyboards.count > 0)
        XCTAssert(cancelButton.exists)

        // Type one character
        searchSearchField.typeText("A")
        Thread.sleep(forTimeInterval: 1)

        // Cancel
        app.buttons["Cancel"].staticTexts["Cancel"].tap()
        XCTAssert(app.keyboards.count == 0)

        // Tap search bar and type lots of characters
        searchSearchField.tap()
        XCTAssert(app.keyboards.count > 0)
        XCTAssert(cancelButton.exists)
        searchSearchField.typeText("This_search_produces_no_results")
        Thread.sleep(forTimeInterval: 3)
        searchSearchField.buttons["Clear text"].tap()
        searchSearchField.typeText("Austin, Texas, USA")

        // Show loading
        XCTAssert(placesListViewLoading.exists)
        Thread.sleep(forTimeInterval: 2.5)

        // Select a place
        app.tables.element(boundBy: 0).cells.element(boundBy: 0).tap()
        Thread.sleep(forTimeInterval: 2)

        // Go back
        app.navigationBars["Details"].buttons["Find a place"].tap()
        Thread.sleep(forTimeInterval: 1)

        // Select another
        app.tables.element(boundBy: 0).cells.element(boundBy: 1).tap()
    }
}
