import MapKit
import UIKit

class PlacesDetailView: UIView {
    private let contentSpacing: CGFloat = 8

    let formattedPlaceLabel: MultilineLabel = {
        let formattedPlaceLabel = MultilineLabel()
        formattedPlaceLabel.textAlignment = .center
        formattedPlaceLabel.font = formattedPlaceLabel.font.withSize(24)
        return formattedPlaceLabel
    }()

    let mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        return mapView
    }()

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        buildViewHierarchy()
        setupConstraints()
        backgroundColor = .systemBackground
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func buildViewHierarchy() {
        addSubview(formattedPlaceLabel)
        addSubview(mapView)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            formattedPlaceLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: contentSpacing),
            formattedPlaceLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -contentSpacing),
            formattedPlaceLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: contentSpacing),
            formattedPlaceLabel.bottomAnchor.constraint(equalTo: mapView.topAnchor, constant: -contentSpacing),
            mapView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
