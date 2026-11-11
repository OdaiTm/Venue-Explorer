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
    var favorite : [Place]
    init() {
        self.Venus =  []
        self.favorite = []
    }
    
    
    
}


func readJSON() -> [Venue]? {

    guard let url = Bundle.main.url(
        forResource: "data",
        withExtension: "json"
    ) else {
        print("JSON file not found")
        return nil
    }

    do {
        let data = try Data(contentsOf: url)

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601

        let dataSet = try decoder.decode([Venue].self, from: data)

        return dataSet

    } catch {
        print("JSON decoding error: \(error)")
        return nil
    }
}

//    func readJSON () -> [Venue]?{
//        let url = URL(filePath: "data.json")
//        let decoder = JSONDecoder()
//        decoder.dateDecodingStrategy = .iso8601
//        let dataSet = try? decoder.decode([Venue].self, from: Data(contentsOf: url))
//        return dataSet
//        
//    }
