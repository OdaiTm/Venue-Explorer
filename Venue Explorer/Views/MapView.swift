
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
    let  myLocation : CLLocationCoordinate2D
    @State var  isDetailShown : Bool = false
//    let manager : LocationManager
    @Environment(LocationManager.self) var locationManager

    
    init(lat: Double, long: Double, placeName: String , myLocation : CLLocationCoordinate2D) {
        self.lat = lat
        self.long = long
        self.placeName = placeName
//        manager = LocationManager()
        self.myLocation = myLocation
    }
    
    
    
    var body: some View {
        let thePlaceLocation = CLLocationCoordinate2D(
            latitude: lat,
            longitude: long
        )
    
        Map(initialViewport: .camera(center :  thePlaceLocation, zoom: 15 , bearing: 45 , pitch: 45)){
            
            PointAnnotation(
                coordinate: myLocation
            ).image(PointAnnotation.Image(image: UIImage(systemName: "figure.wave")!, name: "figure.wave")).iconColor(.blue).iconSize(2)
            
            PointAnnotation(coordinate: thePlaceLocation).image(PointAnnotation.Image(image: UIImage(systemName: "figure.wave")!, name: "figure.wave")).iconColor(.red).iconSize(2).onTapGesture {
                isDetailShown = true
            }
            
            PolylineAnnotation(lineCoordinates: [myLocation ,thePlaceLocation ])
            
        }
            .task {
            
            }.ignoresSafeArea().sheet(isPresented: $isDetailShown){
                VStack(alignment: .listRowSeparatorLeading){
                    Text(placeName)
                    Text("lat : \(lat)")
                    Text("long : \(long)")
                    Image(systemName: "figure.wave").resizable().foregroundStyle(.blue).frame(maxWidth: .infinity, maxHeight: .infinity)
                }.padding().presentationDragIndicator(.visible)

            }
        
        
    }
}

#Preview {
//    MapView(lat: 30, long: 31,placeName: "Jordan")
}
