//
//  MapView.swift
//  Venue Explorer
//
//  Created by Odai Tmrawe on 01/11/2026.
//

import SwiftUI
import MapboxMaps
struct MapView: View {
    let lat : Double
    let long : Double
    let placeName : String

    var body: some View {
        let manager : LocationManager = LocationManager()
        
      var  myLocation = CLLocationCoordinate2D(
            latitude: (manager.location?.coordinate.latitude) ?? 30.1 ,
            longitude: (manager.location?.coordinate.longitude) ?? 30.3
        )
        
        let thePlaceLocation = CLLocationCoordinate2D(
            latitude: lat,
            longitude: long
        )
        
        Map(initialViewport: .camera(center :  thePlaceLocation, zoom: 15 , bearing: 45 , pitch: 45)){
            
            PointAnnotation(
                coordinate: myLocation
            ).image(PointAnnotation.Image(image: UIImage(systemName: "figure.wave")!, name: "figure.wave"))
            
            PointAnnotation(coordinate: thePlaceLocation).image(PointAnnotation.Image(image: UIImage(systemName: "figure.wave")!, name: "figure.wave"))
            
            
            PolylineAnnotation(lineCoordinates: [myLocation ,thePlaceLocation ])
            
        }
            
             
            
            
            .task {
            
        }.ignoresSafeArea()
        
        
    }
}

#Preview {
    MapView(lat: 30, long: 31,placeName: "Jordan")
}
