//
//  SetupUserDefaults.swift
//  CarGo
//
//  Created by user on 4/14/23.
//

import Foundation

extension UserDefaults{
    
    var userModel: UserModel {
        get {
            guard let data = UserDefaults.standard.data(forKey: "\(Utils.id)userModel") else { return UserModel.init() }
            return (try? PropertyListDecoder().decode(UserModel.self, from: data)) ?? UserModel.init()
        }
        set {
            UserDefaults.standard.set(try? PropertyListEncoder().encode(newValue), forKey: "\(Utils.id)userModel")
        }
    }
    
    var phoneNumberModel: [PhoneNumberModel] {
        get {
            guard let data = UserDefaults.standard.data(forKey: "phoneNumberArray") else { return [] }
                        return (try? PropertyListDecoder().decode([PhoneNumberModel].self, from: data)) ?? []
        }
        set {
            UserDefaults.standard.set(try? PropertyListEncoder().encode(newValue), forKey: "phoneNumberArray")
        }
        
    }
}

