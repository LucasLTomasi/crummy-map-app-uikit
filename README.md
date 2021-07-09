# Crummy Map App - UIKit
Alamo Drafthouse iOS Coding Challenge

## Notes:
- Instead of using Storyboard I've created views programmatically since:
  - It's much easier to test this way.
  - On a large meaningful project working with multiple team members it gets harder to manage storyboard (longer load times, hard to fix conflict in git, etc.).
  - Storyboards errors happen at runtime, not at compile time.
  - Storyboard works well when the user-interface is pre-determined and fixed.

- Avoided using external libraries:
  - Usually I would use libraries to make testing easy (Quick, Nimble, etc.) but I have avoided since it was explicitly mentioned to avoid external libs.
  - For cleaner code and testing I've created extensions for String and Image (In the past I have had used RSwift).

- UI Testing:
  - When running on the simulator make sure that the keyboard is displayed by unchecking the `I/O -> Keyboard -> Connect Hardware Keyboard` so the tests work properly. 

## Project Structure:
- <ins>__CrummyApp__</ins>: app root
  - <ins>__API__</ins>: *handles all API logic*
    - <ins>APIClient</ins>: *makes HTTP requests*
    - <ins>APIDecoder</ins>: *decodes APIResponses*
    - <ins>APIError</ins>: *used to return different errors*
    - <ins>APIResponse</ins>: *response for the only route used*
    - <ins>__Protocols__</ins>
      - <ins>APIClientProtocol</ins>: *also used for unit testing*
  - <ins>__Components__</ins>: *reusable UI components*
    - <ins>__Labels__</ins>
      - <ins>MultilineLabel</ins>: *generic label that handles long texts*
    - <ins>__SearchBars__</ins>
      - <ins>SearchBar</ins>: *main and only search bar*
    - <ins>__Stacks__</ins>
      - <ins>ListPlaceholderStack</ins>: *used to display information to the user when the places list is not visible*
    - <ins>__TableViews__</ins> 
      - <ins>TableView</ins>: *main and only table view*
    - <ins>__Views__</ins>: *miscellaneous views or group of views*
      - <ins>ErrorBannerView</ins>: *used to display network connection error*
  - <ins>__Extensions__</ins>
    - <ins>String+Extensions</ins>: *centralized string resource access*
    - <ins>UIImage+Extensions</ins>: *centralized image resource access*
  - <ins>__Managers__</ins>
    - <ins>NetworkConnectionManager</ins>: *observes internet connection availability changes*
  - <ins>__Models__</ins>
    - <ins>Place</ins>: *represents the place that was searched*
  - <ins>__Navigation__</ins>
    - <ins>Coordinator</ins>: *coordinates screen changes*
    - <ins>ViewControllerFactory</ins>: *makes view controllers*
  - <ins>__Scenes__</ins>: *or screens, views, pages, etc*
    - <ins>__PlaceDetail__</ins>
      - <ins>PlaceDetailView</ins>: *holds the detail view*
      - <ins>PlaceDetailViewController</ins>: *second screen that shows the place in detail*
    - <ins>__PlacesList__</ins>
      - <ins>PlacesListContract</ins>: *contract between presenter's input and output, from and to view controller, respectively*
      - <ins>PlacesListCoordinator</ins>: *used by the coordinator to act on changes from this screen*
      - <ins>PlacesListPresenter</ins>: *contains the logic not directly related to UI*
      - <ins>PlacesListView</ins>: *holds the places list view*
      - <ins>PlacesListViewController</ins>: *first screen that shows the search bar and places list*
      - <ins>PlacesListTableViewCell</ins>: *shows the place formatted name on the table view*
  - <ins>__SupportingFiles__</ins>
    - <ins>Localizable.strings</ins>: *stores strings that could be localized*
- <ins>__CrummyMapTests__</ins>: *unit tests*
  - <ins>__Mocks__</ins>: *used by other classes via dependency injection using protocols*
- <ins>__CrummyMapUITests__</ins>
  - <ins>CrummyMapUITests</ins>: *test some UI behaviors based on various types of interactions* 
