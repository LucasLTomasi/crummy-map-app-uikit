import UIKit

class TableView: UITableView {
    init() {
        super.init(frame: .zero, style: .plain)
        translatesAutoresizingMaskIntoConstraints = false
        tableFooterView = UIView()
        register(PlacesListTableViewCell.self, forCellReuseIdentifier: String(describing: PlacesListTableViewCell.self))
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
