import UIKit

protocol HomeViewDelegate {
    func didTapButton1_1()
    func didTapButton1_2()
    func didTapButton1_3()
    func didTapButton2_1()
    func didTapButton2_3()
}

class HomeView: UIView {
    public var delegate: HomeViewDelegate?
    
    private lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 8
        return stack
    }()
    
    private lazy var button1_1: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .gray
        button.setTitle("Exercicio 1-1", for: .normal)
        button.addTarget(self, action: #selector(didTapButton1_1), for: .touchUpInside)
        return button
    }()
    
    private lazy var button1_2: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .gray
        button.setTitle("Exercicio 1-2", for: .normal)
        button.addTarget(self, action: #selector(didTapButton1_2), for: .touchUpInside)
        return button
    }()
    
    private lazy var button1_3: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .gray
        button.setTitle("Exercicio 1-3", for: .normal)
        button.addTarget(self, action: #selector(didTapButton1_3), for: .touchUpInside)
        return button
    }()
    
    private lazy var button2_1: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .gray
        button.setTitle("Exercicio 2-1 e 2-2", for: .normal)
        button.addTarget(self, action: #selector(didTapButton2_1), for: .touchUpInside)
        return button
    }()
    
    private lazy var button2_3: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .gray
        button.setTitle("Exercicio 2-3", for: .normal)
        button.addTarget(self, action: #selector(didTapButton2_3), for: .touchUpInside)
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
    
    @objc func didTapButton1_1() {
        delegate?.didTapButton1_1()
    }
    
    @objc func didTapButton1_2() {
        delegate?.didTapButton1_2()
    }
    
    @objc func didTapButton1_3() {
        delegate?.didTapButton1_3()
    }
    
    @objc func didTapButton2_1() {
        delegate?.didTapButton2_1()
    }
    
    @objc func didTapButton2_3() {
        delegate?.didTapButton2_3()
    }
}

extension HomeView: ViewCode {
    func setupSubviews() {
        stack.addArrangedSubview(button1_1)
        stack.addArrangedSubview(button1_2)
        stack.addArrangedSubview(button1_3)
        stack.addArrangedSubview(button2_1)
        stack.addArrangedSubview(button2_3)
        addSubview(stack)
    }
    
    func setupConstraints() {
        stack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        stack.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        stack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
    }
    
    func setupExtraConfiguration() {
        self.backgroundColor = .white
    }
}
