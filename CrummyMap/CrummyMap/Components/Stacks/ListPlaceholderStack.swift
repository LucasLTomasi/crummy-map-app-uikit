import UIKit

class ListPlaceholderStack: UIStackView {
    private let imageAndLoadingDimension: CGFloat = 25
    var loadingIndicator = UIActivityIndicatorView()
    var imageView: UIImageView?
    var label: MultilineLabel?

    init(image: UIImage?, text: String) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        axis = .vertical
        alignment = .center
        distribution = .equalSpacing
        spacing = 8
        addLoadingIndicator()
        addImage(image)
        addLabel(text)
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addLoadingIndicator() {
        loadingIndicator.startAnimating()
        loadingIndicator.isHidden = true
        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        addArrangedSubview(loadingIndicator)
        NSLayoutConstraint.activate([
            loadingIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }

    private func addImage(_ image: UIImage?) {
        imageView = UIImageView(image: image)
        guard let imageView = imageView else { return }
        imageView.tintColor = .label
        addArrangedSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: imageAndLoadingDimension),
            imageView.widthAnchor.constraint(equalToConstant: imageAndLoadingDimension)
        ])
    }

    private func addLabel(_ text: String) {
        label = MultilineLabel(text)
        guard let label = label else { return }
        label.textAlignment = .center
        label.font = label.font.withSize(20)
        addArrangedSubview(label)
    }
}
