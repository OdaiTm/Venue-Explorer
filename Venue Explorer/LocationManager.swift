//
//  LocationManager.swift.swift
//  CLLocationProject
//
//  Created by Odai Tmrawe on 15/11/2026.
//

import Foundation
import CoreLocation
import Combine


// we extend from the NSObjct cuz the CoreLocation is an Objective C thing

class LocationManager :  NSObject , ObservableObject {
    
    let manager  = CLLocationManager() // first create the Manger
    // create two observed objects for : CLLocation and Auth
    @Published var location : CLLocation?
    @Published var authorizationStatus : CLAuthorizationStatus
    
    
    override init() {
        // register the manager and its accuracy : (u will extend your class )
        authorizationStatus = manager.authorizationStatus
         super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest // this thing will select how accurayte is your application
        //high usage of power hehe
    }
    
    
    func requestPermission() {
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
//        manager.requestLocation()
    }
    
}



extension LocationManager :  CLLocationManagerDelegate {
   
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        authorizationStatus = manager.authorizationStatus
        
    }
    
    
    
    
    
    func locationManager(
            _ manager: CLLocationManager,
            didUpdateLocations locations: [CLLocation]
        ) {
            location = locations.last
        }
    
    
    func locationManager(
           _ manager: CLLocationManager,
           didFailWithError error: Error
       ) {
           print("Location error: \(error.localizedDescription)")
       }
    
    
}
