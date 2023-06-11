import CoreMotion
import UIKit

class Controller2_1: UIViewController {

    let motion = CMMotionManager()
    
    override func viewDidLoad() {
        self.title = "Exercicio 2-1 e 2-2"
        let controllerView = View2_1()
        view = controllerView
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        motion.gyroUpdateInterval = 0.1
        motion.startGyroUpdates(to: .main) { data, error in
            guard let x = data?.rotationRate.x,
                  let y = data?.rotationRate.y,
                  let z = data?.rotationRate.z,
                  let controllerView = self.view as? View2_1 else { return }
            
        
            controllerView.setupGyroData(
                x: String(format: "%.4f", x),
                y: String(format: "%.4f", y),
                z: String(format: "%.4f", z)
            )
        }
        
        motion.magnetometerUpdateInterval = 0.1
        motion.startMagnetometerUpdates(to: .main) { data, error in
            guard let x = data?.magneticField.x,
                  let y = data?.magneticField.y,
                  let z = data?.magneticField.z,
                  let controllerView = self.view as? View2_1 else { return }
            
            controllerView.setupMagnetData(
                x: String(format: "%.2f", x),
                y: String(format: "%.2f", y),
                z: String(format: "%.2f", z)
            )
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        motion.stopGyroUpdates()
        motion.stopMagnetometerUpdates()
    }
}
