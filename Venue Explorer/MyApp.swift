import SwiftUI
import CoreData

@main struct MyApp: App {
    
//    
    @State var dataSet  = DataModel()
    @StateObject var dataFromAPI = APIData()
    @StateObject var dataController = DataController()
    @State var locationManager : LocationManager = LocationManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext , dataController.container.viewContext).environmentObject(dataFromAPI).environment(locationManager)
        }
    }
}
// 


