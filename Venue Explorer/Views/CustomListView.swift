//
//  CustomListView.swift
//  Venue Explorer
//
//  Created by Odai Tmrawe on 01/11/2026.
//

import SwiftUI


enum SortState : String{
    case unsorted = "Sort by"
    case distanceHtoL = "distanceHtoL"
    case distanceLtoH = "distanceLtoH"
    case AtoZ = "AtoZ"
    case ZtoA = "ZtoA"
}


struct CustomListView: View {
    @EnvironmentObject var data : APIData
    let headLine : String
     var venus     : [Venue]
     var places     : [Place] = []
      var floors     : [Floor] = []
    var nextList : Int
    @State var sortState : SortState = .unsorted
    
    init(headLine: String , venus: [Venue]  = [], places: [Place]  = [], floors: [Floor]  = [] , nextList : Int) {
        self.headLine = headLine
        self.venus = venus
        self.places = places
        self.floors = floors
        self.nextList = nextList
    }
    
    @State private var searchString : String = ""
    var body: some View {
        
        let searchResult: [Venue] = {
            let filtered = searchString.isEmpty
                ? venus
                : venus.filter {
                    $0.name.localizedCaseInsensitiveContains(searchString)
                }

            return filtered.sorted {
                switch sortState {

                case .unsorted:
                    return false

                case .distanceHtoL:
                    return $0.latitude > $1.latitude

                case .distanceLtoH:
                    return $0.latitude < $1.latitude

                case .AtoZ:
                    return $0.name < $1.name

                case .ZtoA:
                    return $0.name > $1.name

                default:
                    return false
                }
            }
        }()
        
        
        let searchResult2: [Floor] = {
            let filtered = searchString.isEmpty
                ? floors
                : floors.filter {
                    $0.name.localizedCaseInsensitiveContains(searchString)
                }

            return filtered.sorted {
                switch sortState {

                case .unsorted:
                    return false

                case .distanceHtoL:
                    return $0.level > $1.level

                case .distanceLtoH:
                    return $0.level < $1.level

                case .AtoZ:
                    return $0.name < $1.name

                case .ZtoA:
                    return $0.name > $1.name

                default:
                    return false
                }
            }
        }()
        
        let searchResult3: [Place] = {
            let filtered = searchString.isEmpty
                ? places
                : places.filter {
                    $0.name.localizedCaseInsensitiveContains(searchString)
                }

            return filtered.sorted {
                switch sortState {

                case .unsorted:
                    return false

                case .distanceHtoL:
                    return $0.latitude > $1.latitude

                case .distanceLtoH:
                    return $0.latitude < $1.latitude

                case .AtoZ:
                    return $0.name < $1.name

                case .ZtoA:
                    return $0.name > $1.name

                default:
                    return false
                }
            }
        }()
      
        
        
        VStack{
            Menu(sortState.rawValue){
                Button("Unsorted"){
                    sortState = .unsorted
                }
                
                Button("distance H2L"){
                    sortState = .distanceHtoL
              
                }
                Button("distance L2H"){
                    sortState = .distanceLtoH
              }
                Button("A to Z"){
                    sortState = .AtoZ
             }
                Button("Z to A"){
                    sortState = .ZtoA
            }
            }.foregroundStyle(.primary).frame(maxWidth: .infinity , alignment: .trailing).padding(.trailing,10)
            List(){
                
                if nextList == 1 {
                    
                    ForEach(searchResult ,id: \.id) {
                        venue in
                        NavigationLink{
                            
                            CustomListView(headLine: "Floors", floors: venue.floors, nextList: 2)
                        }
                        label: {
                            LIstViewItem(title: venue.name)
                        }.foregroundStyle(.primary)
                    
                }.navigationTitle(headLine)
                
                
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
                    }.navigationTitle(headLine)
                    
                }
                
                if nextList == 3 {
                    
                    ForEach(searchResult3,id: \.id) {
                        place in
                        NavigationLink{
                            
                            MapView(lat: Double(place.latitude), long: Double(place.longitude) , placeName: place.name)
                        }
                        label: {
                            LIstViewItem(title: place.name)
                                .overlay(alignment: .trailing, content: {

                                    Button {
                                        if let index = data.favorite.firstIndex(where: {
                                            $0.id == place.id
                                        }) {
                                            data.favorite.remove(at: index)
                                        } else {
                                            data.favorite.append(place)
                                        }

                                    } label: {
                                        Image(systemName:
                                            data.favorite.contains(where: {
                                                $0.id == place.id
                                            }) ? "star.fill" : "star"
                                        )
                                        .padding(.trailing, 10)
                                    }
                                    .buttonStyle(.plain)

                                })
                        }.foregroundStyle(.primary)
                    }
                    
                    }
                

        }.frame(maxWidth: .infinity)}.searchable(
            text: $searchString,
            placement: .toolbar
        ).navigationTitle(headLine)
    }

}
    
    


#Preview {
    
    @Previewable @State var data = DataModel()
    CustomListView(headLine: "Venus",nextList: 1)
}







