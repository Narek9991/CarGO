//
//  CarGOData.swift
//  CarGo
//
//  Created by user on 2/8/23.
//

import Foundation

struct CarGOData: Codable {
    var initialCity: String = ""
    var finalCity: String = ""
    var carGoName: String = ""
    var distance: Int = 0
    var date: DateComponents = DateComponents( year: 2023, month: 03, day: 12)
    var carGoWeight: String = ""
    var description: String = ""
    var loadingType: String = ""
    var info: String = ""
    var price: Int = 0
    var paymentType: String = ""
    var moreInfo: String = ""
    var isBookmarksSelected = false
    var id: Int = 0
    var startCityCoordinate: LatLongCoordinate = LatLongCoordinate(lat: 0.0, long: 0.0)
    var finalCityCoordinate: LatLongCoordinate = LatLongCoordinate(lat: 0.0, long: 0.0)
    
    
}

