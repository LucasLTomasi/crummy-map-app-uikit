import UIKit

class PlacesListView: UIView {
    private let label: UILabel = {
        var label = UILabel()
        label.text = "Hello!"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func buildViewHierarchy() {
        addSubview(label)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor)
        ])
    }

    private func setupAdditionalConfiguration() {
        backgroundColor = .white
    }
}
