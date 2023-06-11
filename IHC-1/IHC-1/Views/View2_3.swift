import UIKit

protocol View2_3Delegate {
    func didTapLocationButton()
}

class View2_3: UIView {
    
    public var delegate: View2_3Delegate?
    
    private lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 8
        return stack
    }()
    
    private lazy var locationButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .gray
        button.setTitle("Exibir localizacao", for: .normal)
        button.addTarget(self, action: #selector(didTapLocationButton), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    @objc func didTapLocationButton() {
        delegate?.didTapLocationButton()
    }
}

extension View2_3: ViewCode {
    func setupSubviews() {
        stack.addArrangedSubview(locationButton)
        addSubview(stack)
    }
    
    func setupConstraints() {
        stack.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        stack.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
        locationButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    func setupExtraConfiguration() {
        self.backgroundColor = .white
    }
}
