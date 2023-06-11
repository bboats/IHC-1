import UIKit

class View2_1: UIView {
    
    private lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 32
        return stack
    }()
    
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.text = "Apple nao permite acesso ao sensor de luminosidade sem emitir certificados.\nPor isso utilizei dois sensores disponiveis como substitutos."
        return label
    }()
    
    private let gyroLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Gyroscopio"
        return label
    }()
    
    private let magnetLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Magnetometro"
        return label
    }()
    
    private lazy var gyroField: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        
        return textField
    }()
    
    private lazy var magnetField: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        
        return textField
    }()
    
    private lazy var gyroView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.backgroundColor = .red
        stack.alignment = .center
        stack.axis = .vertical
        stack.spacing = 8
        return stack
    }()
    
    private lazy var magnetView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.backgroundColor = .green
        stack.alignment = .center
        stack.axis = .vertical
        stack.spacing = 8
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    public func setupGyroData(x: String, y: String, z: String) {
        gyroField.text = "X: " + x + ", Y: " + y + ", Z: " + z
    }
    
    public func setupMagnetData(x: String, y: String, z: String) {
        magnetField.text = "X: " + x + ", Y: " + y + ", Z: " + z
    }
}

extension View2_1: ViewCode {
    func setupSubviews() {
        gyroView.addArrangedSubview(gyroLabel)
        gyroView.addArrangedSubview(gyroField)
        
        magnetView.addArrangedSubview(magnetLabel)
        magnetView.addArrangedSubview(magnetField)
        
        stack.addArrangedSubview(infoLabel)
        stack.addArrangedSubview(gyroView)
        stack.addArrangedSubview(magnetView)
        
        addSubview(stack)
    }
    
    func setupConstraints() {
        stack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        stack.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        stack.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
    }
    
    func setupExtraConfiguration() {
        self.backgroundColor = .white
    }
}
