//
//  ViewController.swift
//  AulaMapaUFALManha
//
//  Created by Student on 26/11/22.
//  Copyright © 2022 VelorioSoft. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var map: MKMapView!
    
    var locationManager: CLLocationManager = CLLocationManager()
    var userLocation: CLLocation = CLLocation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.map.showsUserLocation = true
        self.map.setUserTrackingMode(.follow, animated: true)
        self.setupLocationManager()
        self.addGesture()
    }

    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if locations.count > 0 {
            if let location = locations.last {
                self.userLocation = location
                print("Current location: \(self.userLocation.coordinate)")
            }
        }
        
    }
    
    @objc func addAnnotationToMap(gestureRecognizer: UIGestureRecognizer) {
        let touchPoint = gestureRecognizer.location(in: self.map)
        let coordinate: CLLocationCoordinate2D = self.map.convert(touchPoint, toCoordinateFrom: self.map)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "Picolé do JaJá"
        annotation.subtitle = String(describing: "latitude \(coordinate.latitude) longitude \(coordinate.longitude)")
        
        self.map.addAnnotation(annotation)
    }
    
    func addGesture() {
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(self.addAnnotationToMap(gestureRecognizer:)))
        
        longPress.minimumPressDuration = 0.8
        self.map.addGestureRecognizer(longPress)
    }
}

