//
//  Data.swift
//  Venue Explorer
//
//  Created by Odai Tmrawe on 01/11/2026.
//

import Foundation


@Observable
class DataModel {
  
    
    var Venus : [Venue]
    
    init() {
        self.Venus = readJSON() ?? []
    }
    
}



    func readJSON () -> [Venue]?{
        let url = URL(filePath: "/Users/odaitmrawe/Documents/Venue Explorer/Venue Explorer/data.json")
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        var dataSet = try? decoder.decode([Venue].self, from: Data(contentsOf: url))
        return dataSet
        
    }
