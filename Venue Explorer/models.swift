//
//  models.swift
//  Venue Explorer
//
//  Created by Odai Tmrawe on 20/10/2026.
//



struct Venue : Decodable{
    var  id: String
    var  name: String
    var  latitude: Float
    var longitude: Float
    var floors : [Floor]
    
}


struct Floor : Decodable{
    var  id: String
    var  name: String
    var level : Int 
    var places : [Place]
}


struct Place : Decodable{
    var  id: String
    var  name: String
    var category : String
    var  latitude: Float
    var longitude: Float
}





