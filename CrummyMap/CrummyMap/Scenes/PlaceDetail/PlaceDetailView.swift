import UIKit

class PlacesDetailView: UIView {
    var formattedPlaceLabel = FormattedPlaceLabel()

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        buildViewHierarchy()
        setupConstraints()
        formattedPlaceLabel.textAlignment = .center
        backgroundColor = .systemBackground
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func buildViewHierarchy() {
        addSubview(formattedPlaceLabel)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            formattedPlaceLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            formattedPlaceLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            formattedPlaceLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            formattedPlaceLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
