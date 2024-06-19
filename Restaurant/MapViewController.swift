import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {

    @IBOutlet var mapView: MKMapView!
    @IBOutlet var filterButton: UIButton!
    let locationManager = CLLocationManager()
    
    let list = RestaurantList.restaurantArray
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()

        filterButton.setTitle("Filter", for: .normal)
        filterButton.backgroundColor = .black
        filterButton.tintColor = .white
        filterButton.layer.cornerRadius = 10

        let center = CLLocationCoordinate2D(latitude: 37.515690, longitude: 126.891630)
        mapView.region = MKCoordinateRegion(center: center, latitudinalMeters: 1200, longitudinalMeters: 1200)

        showAlllocations()
        checkDeviceLocationAuthorization()
    }
    
    func showAlert() {
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let korean = UIAlertAction(title: "한식", style: .default) { [weak self] _ in
            self?.koreanFoodButton()
        }
        let chinese = UIAlertAction(title: "중식", style: .default) { [weak self] _ in
            self?.chineseFoodButton()
        }
        let japanese = UIAlertAction(title: "일식", style: .default) { [weak self] _ in
            self?.japaneseFoodButton()
        }
        let all = UIAlertAction(title: "전체", style: .default) { [weak self] _ in
            self?.showAlllocations()
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        
        alert.addAction(cancel)
        alert.addAction(korean)
        alert.addAction(japanese)
        alert.addAction(chinese)
        alert.addAction(all)
        
        
        present(alert, animated: true)
    }
    
    @IBAction func filterButtonClicked(_ sender: UIButton) {
        showAlert()
    }
    
    func showAlllocations() {
        
        for element in list {
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: element.latitude, longitude: element.longitude)
            annotation.title = element.name
            mapView.addAnnotation(annotation)
        }
    }
    
    func koreanFoodButton() {
        
        mapView.removeAnnotations(mapView.annotations)
        for element in list {
            if element.category == "한식" {
                let annotation = MKPointAnnotation()
                annotation.coordinate = CLLocationCoordinate2D(latitude: element.latitude, longitude: element.longitude)
                annotation.title = element.name
                mapView.addAnnotation(annotation)
                print("Added annotation for \(element.category), \(element.name)")
            }
        }
    }
    
    func chineseFoodButton() {
        
        mapView.removeAnnotations(mapView.annotations)
        for element in list {
            if element.category == "중식" {
                let annotation = MKPointAnnotation()
                annotation.coordinate = CLLocationCoordinate2D(latitude: element.latitude, longitude: element.longitude)
                annotation.title = element.name
                mapView.addAnnotation(annotation)
                print("Added annotation for \(element.category), \(element.name)")
            }
        }
    }
    
    func japaneseFoodButton() {
        
        mapView.removeAnnotations(mapView.annotations)
        for element in list {
            if element.category == "일식" {
                let annotation = MKPointAnnotation()
                annotation.coordinate = CLLocationCoordinate2D(latitude: element.latitude, longitude: element.longitude)
                annotation.title = element.name
                mapView.addAnnotation(annotation)
                print("Added annotation for \(element.category), \(element.name)")
            }
        }
    }
}

extension MapViewController: CLLocationManagerDelegate {
    
    func checkDeviceLocationAuthorization() {
        if CLLocationManager.locationServicesEnabled() {
            let authorizationStatus = locationManager.authorizationStatus
            checkCurrentLocationAuthorization(status: authorizationStatus)
        } else {
            print("위치 서비스가 꺼져 있어서, 위치 권한 요청을 할 수 없어요")
        }
    }

    
    func checkCurrentLocationAuthorization(status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            print("이 권한에서만 권한 문구를 띄울 수 있음")
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.requestWhenInUseAuthorization()
            
        case .denied:
            showLocationSettingAlert()
            
        case .authorizedWhenInUse:
            print("위치 정보 알려달라고 로직을 구성할 수 있음")
            locationManager.startUpdatingLocation()
            
        default:
            print("Error")
        }
    }
    
    func showLocationSettingAlert() {
        let alert = UIAlertController(title: "위치 정보 이용", message: "위치 서비스를 사용할 수 없습니다. 설정에서 위치 서비스를 켜주세요", preferredStyle: .alert)
        
        let goSetting = UIAlertAction(title: "설정으로 이동", style: .default) { _ in
            if let setting = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(setting)
            }
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        alert.addAction(goSetting)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let coordinate = locations.last?.coordinate {
            print(coordinate)
            setRegionAndAnnotation(center: coordinate)
        }
        locationManager.stopUpdatingLocation()
    }
    
    func setRegionAndAnnotation(center: CLLocationCoordinate2D) {
        let region = MKCoordinateRegion(center: center, latitudinalMeters: 600, longitudinalMeters: 600)
        mapView.setRegion(region, animated: true)
    }
}
