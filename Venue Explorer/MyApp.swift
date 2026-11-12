import SwiftUI
import CoreData

@main struct MyApp: App {
    
//    
    @State var dataSet  = DataModel()
    @StateObject var dataFromAPI = APIData()
    @StateObject var dataController = DataController()

    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext , dataController.container.viewContext).environmentObject(dataFromAPI)
        }
    }
}
// 


