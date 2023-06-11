import UIKit

class View1_1: UIView {
    
    private lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 8
        return stack
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .gray
        button.setTitle("Sum", for: .normal)
        button.addTarget(self, action: #selector(didTapSumButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.attributedPlaceholder = NSAttributedString(
            string: "Enter a number",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        textField.keyboardType = .decimalPad
        
        return textField
    }()
    
    private let line: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        return view
    }()
    
    private lazy var textField2: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.attributedPlaceholder = NSAttributedString(
            string: "Enter a number",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        textField.keyboardType = .decimalPad
        
        return textField
    }()
    
    private let line2: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        return view
    }()
    
    private let resultLabel: UILabel = {
        let label = UILabel()
        label.text = "Resultado ="
        label.textColor = .black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    @objc func didTapSumButton() {
        guard let firstText = textField.text,
              let secondText = textField2.text,
              let firstNumber = Int(firstText),
              let secondNumber = Int(secondText) else {
            return
        }
        
        resultLabel.text = "Resultado = " + String(firstNumber + secondNumber)
        textField.resignFirstResponder()
        textField2.resignFirstResponder()
    }
}

extension View1_1: ViewCode {
    func setupSubviews() {
        stack.addArrangedSubview(textField)
        stack.addArrangedSubview(line)
        stack.addArrangedSubview(textField2)
        stack.addArrangedSubview(line2)
        
        stack.addArrangedSubview(button)
        stack.addArrangedSubview(resultLabel)
        addSubview(stack)
    }
    
    func setupConstraints() {
        stack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        stack.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        stack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        line.heightAnchor.constraint(equalToConstant: 1).isActive = true
        line2.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    func setupExtraConfiguration() {
        self.backgroundColor = .white
    }
}
