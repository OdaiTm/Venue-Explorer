import SwiftUI
import Playgrounds

struct ContentView: View {
    
    @EnvironmentObject var dataFromAPI : APIData
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var favoritesDC : FetchedResults<PlaceDC>
    
    
    @State private var headLine = String(
        localized: "venusNavTitle"
    )

    let head = String(localized: "favoritePlaces")

    let head1 = String(localized: "venusNavTitle")
    
    var body: some View {
       
            TabView{
                Tab("", systemImage: "location.fill"){
                    NavigationStack{  CustomListView(headLine: head1, venus: dataFromAPI.Venus, nextList: 1)}
                }.accessibilityLabel(head1)
                    .accessibilityHint("the \(head1) tab ")
                
                Tab("", systemImage: "star.fill"){
                    NavigationStack{  CustomListView(headLine: head, places: dataFromAPI.favorite, nextList: 3)}
                }.accessibilityLabel(head)
                    .accessibilityHint("the \(head) tab ")
             
                
            }.task {
                
                do {
                  try await  dataFromAPI.getData(urlLink: "https://raw.githubusercontent.com/OdaiTm/Venue-Explorer/refs/heads/readJSON/Venue%20Explorer/data.json")
                   
                    for f in favoritesDC {
                        dataFromAPI.favorite.append(Place(id: f.id ?? "", name: f.name ?? "" , category: f.category ?? "" , latitude: f.latitude ?? 0.0, longitude: f.longitude ?? 0.0))
                    }
                    
                    
                    
                }catch {
                    
                }
                
                
                
            }
            
        
                    
                }
        }
