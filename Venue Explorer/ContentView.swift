import SwiftUI
import Playgrounds

struct ContentView: View {
    
    @Environment(DataModel.self) var dataSet

    
    var body: some View {
       
                    
        CustomListView(headLine: "Venus", venus: dataSet.Venus, nextList: 1)
                    
                    
                }
        }
