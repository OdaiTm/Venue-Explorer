//
//  CustomListView.swift
//  Venue Explorer
//
//  Created by Odai Tmrawe on 01/11/2026.
//

import SwiftUI

struct CustomListView: View {
    
    let headLine : String
    var venus     : [Venue]
    var places     : [Place] = []
    var floors     : [Floor] = []
    var nextList : Int
    
    init(headLine: String, venus: [Venue]  = [], places: [Place]  = [], floors: [Floor]  = [] , nextList : Int) {
        self.headLine = headLine
        self.venus = venus
        self.places = places
        self.floors = floors
        self.nextList = nextList
        self.searchString = searchString
    }
    
    
    @State private var searchString : String = ""
    
    
    
    var body: some View {
        
        
        

        
        var searchResult =
        searchString != "" ?
        
        venus.filter{
            item
            in
            item.name.contains(searchString)
        } : venus
        
        var searchResult2 =
        searchString != "" ?
        floors.filter{
            item
            in
            item.name.contains(searchString)
        } : floors
        
        
        var searchResult3 =
        searchString != "" ?
        places.filter{
            item
            in
            item.name.contains(searchString)
        } : places
        
        NavigationStack{
            ScrollView(){
                if nextList == 1 {
                    ForEach(searchResult,id: \.id) {
                        venue in
                        NavigationLink{
                            
                            CustomListView(headLine: "Floors", floors: venue.floors, nextList: 2)
                            
                        }
                        label: {
                            LIstViewItem(title: venue.name)
                        }.foregroundStyle(.primary)
                    }
                }
                if nextList == 2 {
                    ForEach(searchResult2,id: \.id) {
                        floor in
                        NavigationLink{
                            CustomListView(headLine: "Place", places: floor.places, nextList: 3)
                        }
                        label: {
                            LIstViewItem(title: floor.name)
                        }.foregroundStyle(.primary)
                    }
                    
                }
                
                if nextList == 3 {
                    ForEach(searchResult3,id: \.id) {
                        place in
                        NavigationLink{
                            
                            MapView(lat: Double(place.latitude), long: Double(place.longitude) , placeName: place.name)
                        }
                        label: {
                            LIstViewItem(title: place.name)
                        }.foregroundStyle(.primary)
                    }
                    
                }
                
                
            }.navigationTitle(headLine).searchable(text: $searchString)
        }
    }
    
    
    
}
    
    
   





#Preview {
    
    @Previewable @State var data = DataModel()
    CustomListView(headLine: "Venus",nextList: 1)
}







