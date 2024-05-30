//
//  MapViewController.swift
//  Travel
//
//  Created by Jaka on 2024-05-30.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet var mapView: MKMapView!
    @IBOutlet var filterButton: UIButton!
    
    let list = RestaurantList.restaurantArray
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        filterButton.setTitle("Filter", for: .normal)
        filterButton.backgroundColor = .black
        filterButton.tintColor = .white
        filterButton.layer.cornerRadius = 10
        
        let center = CLLocationCoordinate2D(latitude: 37.515690, longitude: 126.891630)
        mapView.region = MKCoordinateRegion(center: center, latitudinalMeters: 1200, longitudinalMeters: 1200)
        
        showAlllocations()
        
    }
    
    func showAlert() {
        //1.
        let alert = UIAlertController(
            title: nil,
            message: nil,
            preferredStyle: .actionSheet)
        
        //2.

        let korean = UIAlertAction(title: "한식", style: .default) {_ in
            self.koreanFoodButton()
        }
        let chinese = UIAlertAction(title: "중식", style: .default) {_ in
            self.chineseFoodButton()
        }
        let japanese = UIAlertAction(title: "일식", style: .default) {_ in
            self.japaneseFoodButton()
        }
        let all = UIAlertAction(title: "전체", style: .default) {_ in
            self.showAlllocations()
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        //3.
        alert.addAction(cancel)
        alert.addAction(korean)
        alert.addAction(japanese)
        alert.addAction(chinese)
        alert.addAction(all)
        
        //4.
        present(alert, animated: true)
    }
    
  
    @IBAction func filterButtonClicked(_ sender: UIButton) {
        showAlert()
//        for annotation in mapView.annotations {
//            mapView.removeAnnotation(annotation)
        
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
        let annotation = MKPointAnnotation()
            if element.category == "한식" {
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
        let annotation = MKPointAnnotation()
            if element.category == "중식" {
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
        let annotation = MKPointAnnotation()
            if element.category == "일식" {
                annotation.coordinate = CLLocationCoordinate2D(latitude: element.latitude, longitude: element.longitude)
                annotation.title = element.name
                mapView.addAnnotation(annotation)
                print("Added annotation for \(element.category), \(element.name)")
            }
        }
    }
}
