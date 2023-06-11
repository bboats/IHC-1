import UIKit

protocol ViewCode {
    func setupSubviews()
    func setupConstraints()
    func setupExtraConfiguration()
    func setupView()
}

extension ViewCode {
    func setupView() {
        setupSubviews()
        setupConstraints()
        setupExtraConfiguration()
    }
}
