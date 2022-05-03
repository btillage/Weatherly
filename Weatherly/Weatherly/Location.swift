//
//  Location.swift
//  Weatherly
//
//  Created by Berry Tillage on 5/2/22.
//

import Foundation
import CoreLocation
import MapKit

final class LocationViewModel: NSObject, CLLocationManagerDelegate, ObservableObject {
    
    var locationManager: CLLocationManager?
    
    var lat: CLLocationDegrees = 0
    var long: CLLocationDegrees = 0
    
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 12, longitude: 12), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    
    func checkServices() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager!.delegate = self
        }
        else {
            print("Turn location services on")
        }
    }
    
    private func checkAuth() {
        guard let locationManager = locationManager else { return }
        
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Location Restricted")
        case .denied:
            print("Denied Location permissions, go to setttings and allow")
        case .authorizedWhenInUse, .authorizedAlways:
            region = MKCoordinateRegion(center: locationManager.location!.coordinate,
                                        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            lat = locationManager.location!.coordinate.latitude
            long = locationManager.location!.coordinate.longitude
        @unknown default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkAuth()
    }
}
