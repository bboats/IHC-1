import UIKit
import CoreLocation

class Controller2_3: UIViewController {

    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        self.title = "Exercicio 2-3"
        let controllerView = View2_3()
        controllerView.delegate = self
        view = controllerView
    }
    
    override func viewDidAppear(_ animated: Bool) {
        locationManager.requestWhenInUseAuthorization()
    }
}

extension Controller2_3: View2_3Delegate {
    func didTapLocationButton() {
        if ( locationManager.authorizationStatus == .authorizedWhenInUse ||
            locationManager.authorizationStatus == .authorizedAlways ){
            guard let latitude = locationManager.location?.coordinate.latitude.description,
                  let longitude = locationManager.location?.coordinate.longitude.description else { return }
            let alert = UIAlertController(
                title: "Resultado",
                message: "Latitude: " + latitude + "\nLongitude: " + longitude,
                preferredStyle: UIAlertController.Style.alert
            )
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        

    }
}
