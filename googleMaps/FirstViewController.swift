//
//  FirstViewController.swift
//  googleMaps
//
//  Created by Rian Putra Mantovani on 23/03/19.
//  Copyright © 2019 Rian Putra Mantovani. All rights reserved.
//

import UIKit
import CoreLocation
import GoogleMaps

class FirstViewController: UIViewController {
    
    private let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }


}


extension FirstViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let coordinate = manager.location?.coordinate else { return }
         let camera = GMSCameraPosition.camera(withLatitude: coordinate.latitude, longitude: coordinate.longitude, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
        view = mapView
    }
}

