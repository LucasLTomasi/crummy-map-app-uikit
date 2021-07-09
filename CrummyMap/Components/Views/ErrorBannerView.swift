import UIKit

class ErrorBannerView: UIView {
    private let message = UILabel()
    private let bannerMaxHeight: CGFloat = 34
    var bannerHeight: NSLayoutConstraint?

    init() {
        super.init(frame: .zero)
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .label
        setupMessage()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupMessage() {
        message.translatesAutoresizingMaskIntoConstraints = false
        message.textAlignment = .center
        message.numberOfLines = 1
        message.textColor = .systemBackground
        message.text = String.Localizable.noInternetConnection
        addSubview(message)
        NSLayoutConstraint.activate([
            message.centerYAnchor.constraint(equalTo: centerYAnchor),
            message.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }

    private func fadeText(alpha: CGFloat) {
        message.alpha = alpha
    }

    func update(shouldHide: Bool, completion: @escaping () -> Void) {
        let height: CGFloat = shouldHide ? 0 : bannerMaxHeight
        let alpha: CGFloat = shouldHide ? 0 : 1
        UIView.animate(withDuration: 1, animations: {
            self.bannerHeight?.constant = height
            self.fadeText(alpha: alpha)
            completion()
        })
    }
}
