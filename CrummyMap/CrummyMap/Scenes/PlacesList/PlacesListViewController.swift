import UIKit

class PlacesListViewController: UIViewController {
    private let screen = PlacesListView()
    private let presenter: PlacesListPresenterInput?
    private var places: [Place] = []

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
        title = String.Localizable.placesListViewTitle
        screen.tableView.delegate = self
        screen.tableView.dataSource = self
        screen.searchBar.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if places.isEmpty {
            screen.showIdlePlaceholder()
        } else {
            screen.showPlacesList()
        }
    }
}

extension PlacesListViewController: PlacesListPresenterOutput {}

extension PlacesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        places.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = screen.tableView.dequeueReusableCell(withIdentifier: String(describing: PlacesListTableViewCell.self))
            as? PlacesListTableViewCell else {
            return UITableViewCell()
        }
        cell.formattedPlaceLabel.text = places[indexPath.row].formatted
        return cell
    }
}

extension PlacesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        screen.searchBar.resignFirstResponder()
        presenter?.navigateToPlaceDetail(place: places[indexPath.row], navigationController: navigationController)
    }
}

extension PlacesListViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        if screen.searchBar.text?.isEmpty == true {
            screen.showIdlePlaceholder()
        }
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            screen.showIdlePlaceholder()
        } else {
            screen.showLoadingPlaceholder()
            presenter?.getPlaces(with: searchText) { result in
                switch result {
                case let .success(places):
                    self.places = places
                    DispatchQueue.main.async {
                        self.screen.showPlacesList()
                        self.screen.tableView.reloadData()
                    }
                case .failure:
                    DispatchQueue.main.async {
                        self.screen.showError()
                    }
                }
            }
        }
    }
}
