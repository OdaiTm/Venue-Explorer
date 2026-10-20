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
                }catch
                    ReadErrors.ReadError {
                    
                    print(ReadErrors.ReadError)
                }
            }
           
                if !d.isEmpty {
                    
                        
                    printD(d : d , name : "City Center" , floor : "Ground Floor",  )
                
                    
                    
                    
                    
                }
        }
    }
}











func printD(d : [Venue] , name : String , floor : String ) {
    
    
    let searchResult = d.first{(i) in i.name == name
        
    }
    print("///////////////////////////////")
    print(searchResult)
    print("///////////////////////////////")

    let floormembers = d.map{
        (i) in i.floors.filter{
        (j) in j.name == floor
    }
    }
    
    print("///////////////////////////////")
    print(floormembers)
    print("///////////////////////////////")

    
    
    
    
    var sortedD =  d.sorted(by: {(v1 , v2) in v1.distance > v2.distance})
    
    print("///////////////////////////////")

    print(sortedD)
    
    print("///////////////////////////////")

}



extension Venue {
    var distance : Float{
        return   sqrt(pow(2 , latitude - 31.982533) + pow(2 ,longitude - 35.865627 ) )
        
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
