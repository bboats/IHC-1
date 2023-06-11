import UIKit

class Controller1_2_alt: UIViewController {

    override func viewDidLoad() {
        self.title = "Exercicio 1-2 Resultado"
        let controllerView = View1_2_alt()
        view = controllerView
    }
    
    public func configure(with message: String){
        guard let controllerView = view as? View1_2_alt else { return }
        controllerView.setupResultMessage(with: message)
    }
}
