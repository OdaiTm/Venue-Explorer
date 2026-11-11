//
//  DataFromAPI.swift
//  Venue Explorer
//
//  Created by Odai Tmrawe on 11/11/2026.
//

import Foundation
import Combine


enum NetworkError : Error {
    case invalidURL
    case faildToLoadData
}

class APIData : ObservableObject {
    
    @Published  var Venus : [Venue]
    @Published    var favorite : [Place]
    init() {
        self.Venus = []
        self.favorite = []
    }
    func getData(urlLink : String) async throws{
        
        guard let url = URL(string: urlLink) else {
            throw NetworkError.faildToLoadData
        }
        do {
            let (data, _) =   try await URLSession.shared.data(from: url)
            
            self.Venus =  try JSONDecoder().decode([Venue].self, from: data)
//            print(Venus)
        }
        catch {
            throw NetworkError.invalidURL
        }
        
    }

}
