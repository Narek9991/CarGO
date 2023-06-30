//
//  CityCoordinate.swift
//  CarGo
//
//  Created by user on 5/8/23.
//

import Foundation

class CityCoordinate: Codable{
    
   
    public static var moscow = LatLongCoordinate(lat: 55.755825, long: 37.617298)
    public static var saratov = LatLongCoordinate(lat: 51.534229, long: 46.033321)
    public static var nijniNovgorod = LatLongCoordinate(lat: 56.326790, long: 44.005989)
    public static var pyatigorsk = LatLongCoordinate(lat: 44.039028, long: 43.065632)
    public static var tyumen = LatLongCoordinate(lat: 57.154560, long: 65.537490)
    public static var ekatirinburg = LatLongCoordinate(lat: 56.8519, long: 60.6122)
    public static var sanktPeterburg = LatLongCoordinate(lat: 59.9342802, long: 30.3350986)
    public static var kemerovo = LatLongCoordinate(lat: 55.33333, long: 86.08333)
    public static var chelyabinsk = LatLongCoordinate(lat: 55.164440, long: 61.436844)
    
    
}

struct LatLongCoordinate: Codable {
    var lat: Double
    var long: Double
    
    init(lat: Double, long: Double) {
        self.lat = lat
        self.long = long
    }
}
