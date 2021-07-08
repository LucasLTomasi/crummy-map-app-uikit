import UIKit

class PlacesListTableViewCell: UITableViewCell {
    private let contentSpacing: CGFloat = 12

    let formattedPlaceLabel = FormattedPlaceLabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildViewHierarchy()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func buildViewHierarchy() {
        addSubview(formattedPlaceLabel)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            formattedPlaceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: contentSpacing),
            formattedPlaceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -contentSpacing),
            formattedPlaceLabel.topAnchor.constraint(equalTo: topAnchor, constant: contentSpacing),
            formattedPlaceLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -contentSpacing)
        ])
    }
}
