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
        screen.tableView.delegate = self
        screen.tableView.dataSource = self
        presenter?.getPlaces(with: "Austin, Texas, USA") { result in
            switch result {
            case let .success(places):
                self.places = places
                DispatchQueue.main.async {
                    self.screen.tableView.reloadData()
                }
            case let .failure(apiError):
                print(apiError)
            }
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
        cell.label.text = places[indexPath.row].formatted
        return cell
    }
}

extension PlacesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected at \(indexPath.row)")
    }
}
