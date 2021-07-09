import UIKit

class PlacesListView: UIView {
    let searchBar = SearchBar()
    let placeholderStack = ListPlaceholderStack(image: UIImage.arrowtriangleUpFill,
                                                text: String.Localizable.placesListViewPlaceholderText)
    let tableView = TableView()

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        buildViewHierarchy()
        setupConstraints()
        tableView.isHidden = true
        backgroundColor = .systemBackground
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func buildViewHierarchy() {
        addSubview(searchBar)
        addSubview(tableView)
        addSubview(placeholderStack)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            searchBar.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            searchBar.bottomAnchor.constraint(equalTo: tableView.topAnchor),
            placeholderStack.centerYAnchor.constraint(equalTo: centerYAnchor),
            placeholderStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    func showPlacesList() {
        placeholderStack.isHidden = true
        tableView.isHidden = false
    }

    func showIdlePlaceholder() {
        tableView.isHidden = true
        placeholderStack.label?.text = String.Localizable.placesListViewPlaceholderText
        placeholderStack.loadingIndicator.isHidden = true
        placeholderStack.imageView?.isHidden = false
        placeholderStack.isHidden = false
    }

    func showLoadingPlaceholder() {
        tableView.isHidden = true
        placeholderStack.label?.text = String.Localizable.placesListViewLoading
        placeholderStack.imageView?.isHidden = true
        placeholderStack.loadingIndicator.isHidden = false
        placeholderStack.isHidden = false
    }

    func showError(text: String) {
        tableView.isHidden = true
        placeholderStack.label?.text = text
        placeholderStack.imageView?.isHidden = true
        placeholderStack.loadingIndicator.isHidden = true
        placeholderStack.isHidden = false
    }
}
