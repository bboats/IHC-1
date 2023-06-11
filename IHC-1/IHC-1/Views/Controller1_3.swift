import CoreMotion
import UIKit

class Controller1_3: UIViewController {

    let motion = CMMotionManager()
    
    override func viewDidLoad() {
        self.title = "Exercicio 1-3"
        let controllerView = View1_3()
        view = controllerView
    }
    
    override func viewDidAppear(_ animated: Bool) {
        motion.accelerometerUpdateInterval = 0.1
        motion.startAccelerometerUpdates(to: .main) { data, error in
            guard let x = data?.acceleration.x,
                  let y = data?.acceleration.y,
                  let z = data?.acceleration.z,
                  let controllerView = self.view as? View1_3 else { return }
            
            if x > 1.5 || y > 1.5 || z > 1.5 {
                self.navigationController?.pushViewController(Controller1_3_alt(), animated: true)
                self.motion.stopAccelerometerUpdates() 
            }
            
            controllerView.setupFields(
                x: String(format: "%.4f", x),
                y: String(format: "%.4f", y),
                z: String(format: "%.4f", z)
            )
        }
    }
}
