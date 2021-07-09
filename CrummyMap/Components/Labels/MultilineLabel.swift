import UIKit

class MultilineLabel: UILabel {
    init(_ text: String = "") {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        lineBreakMode = .byWordWrapping
        numberOfLines = 0
        self.text = text
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
