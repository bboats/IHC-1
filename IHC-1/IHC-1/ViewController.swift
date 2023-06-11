import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        self.title = "IHC Exercicios"
        let homeView = HomeView()
        homeView.delegate = self
        view = homeView
    }
}

extension ViewController: HomeViewDelegate {
    func didTapButton1_1() {
        navigationController?.pushViewController(Controller1_1(), animated: true)
    }
    
    func didTapButton1_2() {
        navigationController?.pushViewController(Controller1_2(), animated: true)
    }
    
    func didTapButton1_3() {
        navigationController?.pushViewController(Controller1_3(), animated: true)
    }
    
    func didTapButton2_1() {
        navigationController?.pushViewController(Controller2_1(), animated: true)
    }
    
    func didTapButton2_3() {
        navigationController?.pushViewController(Controller2_3(), animated: true)
    }
}
