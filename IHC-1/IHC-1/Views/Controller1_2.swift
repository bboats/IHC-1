import UIKit

class Controller1_2: UIViewController {

    override func viewDidLoad() {
        self.title = "Exercicio 1-2"
        let controllerView = View1_2()
        controllerView.delegate = self
        view = controllerView
    }
}

extension Controller1_2: View1_2Delegate {
    func didTapSendButton(with message: String) {
        let destination = Controller1_2_alt()
        destination.configure(with: message)
        navigationController?.pushViewController(destination, animated: true)
    }
}
