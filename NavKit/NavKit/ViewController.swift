//
//  ViewController.swift
//  NavKit
//
//  Created by MCS on 9/9/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var theMapView: MKMapView!
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation? {
    didSet {
    guard let unwrappedLocation = currentLocation else { return }
        theMapView.setCenter(unwrappedLocation.coordinate, animated: true)
        let mapSize = MKMapSize(width: 40000, height: 20000)
        let mapPoint = MKMapPoint(unwrappedLocation.coordinate)
        let  mapRect = MKMapRect(origin: mapPoint, size: mapSize)
        let annotation = MKPointAnnotation()
        annotation.coordinate = unwrappedLocation.coordinate
        theMapView.addAnnotation(annotation)
        theMapView.setVisibleMapRect(mapRect, animated: true)
    }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        locationManager.startUpdatingLocation()
        
    }


}
extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        print(locations)
        currentLocation = locations.first 
        CLGeocoder().reverseGeocodeLocation(locations.first!) {(placemarks, error) in
            print(placemarks)
            print(error?.localizedDescription)
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error){
        print(error.localizedDescription)
    }
}
