import SwiftUI
import Playgrounds

struct ContentView: View {
    
    @Environment(DataModel.self) var dataSet
    @EnvironmentObject var dataFromAPI : APIData
    @State var headLine : String = "Venus"
    let head = "Favorite Places"
    let head1 = "Venus"
    var body: some View {
       
            TabView{
                Tab("", systemImage: "location.fill"){
                    NavigationStack{  CustomListView(headLine: head1, venus: dataFromAPI.Venus, nextList: 1)}
                }
                
                Tab("", systemImage: "star.fill"){
                    NavigationStack{  CustomListView(headLine: head, places: dataFromAPI.favorite, nextList: 3)}
                }
                
                
            }.task {
                
                do {
                  try await  dataFromAPI.getData(urlLink: "https://raw.githubusercontent.com/OdaiTm/Venue-Explorer/refs/heads/readJSON/Venue%20Explorer/data.json")
                   
                }catch {
                    
                }
                
                
                
            }
            
        
                    
                }
        }
