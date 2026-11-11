//
//  MapView.swift
//  Venue Explorer
//
//  Created by Odai Tmrawe on 01/11/2026.
//

import SwiftUI
import MapKit
struct MapView: View {
    let lat : Double
    let long : Double
    let placeName : String
    var body: some View {
        
        Map(initialPosition: .region(
            MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: lat, longitude: long),
                span: MKCoordinateSpan(
                    latitudeDelta: 0.01,
                    longitudeDelta: 0.01    
                )
                
            )
        )
        ,content: {
            Marker(placeName                   ,
                   coordinate: CLLocationCoordinate2D(
                    latitude: lat,
                    longitude: long
                )
            
            
            )
            
        }
        
        )
        
        
    }
}

#Preview {
    MapView(lat: 30, long: 31,placeName: "Jordan")
}
