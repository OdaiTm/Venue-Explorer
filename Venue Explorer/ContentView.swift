import SwiftUI
import Playgrounds

struct ContentView: View {
    
    @State var d : [Venue] = []
    var body: some View {
        Text("Hello, world!")
            .padding()
        
        Button("read the JSON"){
            
            var t = Task {
                do{
                    d =   try await readJSON()
                    print(d)
                    
                    
                    
                    
                    
                    
                    
                    
                }catch
                    ReadErrors.ReadError {
                    
                    print(ReadErrors.ReadError)
                }
            }
        }
    }
}



func readJSON () async throws -> [Venue]{
    var url = URL(filePath: "/Users/odaitmrawe/Documents/Venue Explorer/Venue Explorer/data.json")
    
    var Venues : [Venue] = []
    
    do{
        var data = try await URLSession.shared.data(from:url )
        
        var decoder = JSONDecoder()
        
        Venues  =  try decoder.decode([Venue].self, from: data.0)
 
    }catch{
        
        throw ReadErrors.ReadError
        
    }
   
    
    return Venues
    
}





enum ReadErrors : Error {
    case ReadError
}
