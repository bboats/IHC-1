import UIKit

class View1_3: UIView {
    
    private lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.spacing = 8
        return stack
    }()
    
    private lazy var xField: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        
        return textField
    }()
    
    private lazy var yField: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        
        return textField
    }()
    
    private lazy var zField: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    public func setupFields(x: String, y: String, z: String){
        xField.text = "X = " + x
        yField.text = "Y = " + y
        zField.text = "Z = " + z
    }
}

extension View1_3: ViewCode {
    func setupSubviews() {
        stack.addArrangedSubview(xField)
        stack.addArrangedSubview(yField)
        stack.addArrangedSubview(zField)
        addSubview(stack)
    }
    
    func setupConstraints() {
        stack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 32).isActive = true
        stack.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -32).isActive = true
        stack.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
    }
    
    func setupExtraConfiguration() {
        self.backgroundColor = .white
    }
}
