//
//  File.swift
//  CarGo
//
//  Created by user on 4/13/23.
//

import Foundation

struct PhoneNumberModel: Codable {

    var number: String
    var id: Int
    
    
    init(number: String, id: Int) {
            self.number = number
            self.id = id
        }
}




