import UIKit

protocol View1_2Delegate {
    func didTapSendButton(with: String)
}

class View1_2: UIView {
    public var delegate: View1_2Delegate?
    
    private lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 8
        return stack
    }()
    
    private lazy var verticalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 4
        return stack
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .gray
        button.setTitle("Send", for: .normal)
        button.addTarget(self, action: #selector(didTapSendButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.attributedPlaceholder = NSAttributedString(
            string: "Enter a message",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        
        return textField
    }()
    
    private let line: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    @objc func didTapSendButton() {
        guard let message = textField.text else { return }
        delegate?.didTapSendButton(with: message)
    }
}

extension View1_2: ViewCode {
    func setupSubviews() {
        verticalStack.addArrangedSubview(textField)
        verticalStack.addArrangedSubview(line)
        
        stack.addArrangedSubview(verticalStack)
        stack.addArrangedSubview(button)
        addSubview(stack)
    }
    
    func setupConstraints() {
        stack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        stack.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        stack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: 60).isActive = true
        line.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    func setupExtraConfiguration() {
        self.backgroundColor = .white
    }
}
