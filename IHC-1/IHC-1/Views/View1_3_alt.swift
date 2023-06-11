import UIKit

class View1_3_alt: UIView {
    
    private lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 8
        return stack
    }()
    
    private let resultLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Valor 1.5 atingido no acelerometro"
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
    
    public func setupResultMessage(with message: String){
        resultLabel.text = message
    }
}

extension View1_3_alt: ViewCode {
    func setupSubviews() {
        stack.addArrangedSubview(resultLabel)
        addSubview(stack)
    }
    
    func setupConstraints() {
        stack.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        stack.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
    }
    
    func setupExtraConfiguration() {
        self.backgroundColor = .white
    }
}
