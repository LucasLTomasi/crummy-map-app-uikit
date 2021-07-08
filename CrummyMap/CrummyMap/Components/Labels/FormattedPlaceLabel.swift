import UIKit

class FormattedPlaceLabel: UILabel {
    init(_ formattedName: String = "") {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        lineBreakMode = .byWordWrapping
        numberOfLines = 0
        text = formattedName
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
