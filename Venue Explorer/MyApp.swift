import SwiftUI

@main struct MyApp: App {
    
    
    @State var dataSet  = DataModel()
    @StateObject var dataFromAPI = APIData()
    
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(dataSet).environmentObject(dataFromAPI)
        }
    }
}
// 


