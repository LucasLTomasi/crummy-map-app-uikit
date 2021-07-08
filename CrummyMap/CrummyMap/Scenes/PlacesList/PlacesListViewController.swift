import UIKit

class PlacesListViewController: UIViewController {
    private let screen = PlacesListView()
    private let presenter: PlacesListPresenterInput?

    init(presenter: PlacesListPresenterInput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view = screen
        presenter?.getPlaces(with: "Austin, Texas, USA") { places in
            print(places)
        }
    }
}

extension PlacesListViewController: PlacesListPresenterOutput {}

