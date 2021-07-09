import UIKit

class SearchBar: UISearchBar {
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        searchBarStyle = .minimal
        placeholder = String.Localizable.searchBarPlaceholder
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
