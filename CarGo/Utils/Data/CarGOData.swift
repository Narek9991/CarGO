//
//  CarGOData.swift
//  CarGo
//
//  Created by user on 2/8/23.
//

import Foundation

class CarGOData {
    var initialCity : String = ""
    var finalCity : String = ""
    var distance : Int = 0
    var date : DateComponents = DateComponents( year: 2023, month: 03, day: 12)
    var description : String = ""
    var info : String = ""
    var price : Int = 0
    
    init(initialCity : String, finalCity : String, distance : Int, description : String, info : String, price : Int, date : DateComponents) {
        self.initialCity = initialCity
        self.finalCity = finalCity
        self.distance = distance
        self.description = description
        self.info = info
        self.price = price
        self.date = date
        
    }
    
}
