import SwiftUI

@main struct MyApp: App {
    
    
    @State var dataSet  = DataModel()
    var body: some Scene {
        WindowGroup {
            ContentView().environment(dataSet)
        }
    }
}
// 


