import UIKit

class PlacesListTableViewCell: UITableViewCell {
    private let contentSpacing: CGFloat = 12

    let label: UILabel = {
        var label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildViewHierarchy()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func buildViewHierarchy() {
        addSubview(label)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: contentSpacing),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -contentSpacing),
            label.topAnchor.constraint(equalTo: topAnchor, constant: contentSpacing),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -contentSpacing)
        ])
    }
}
