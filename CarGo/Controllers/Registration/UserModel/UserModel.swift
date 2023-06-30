//
//  UserModel.swift
//  CarGo
//
//  Created by user on 4/14/23.
//

import Foundation

struct UserModel: Codable {

    var id: Int = 0
    var name : String = ""
    var isSuccess: Bool = false
    
    var carGoDataArray: [CarGOData] = ([] as? [CarGOData])!
    var selectedCarGoDataArray: [CarGOData] = ([] as? [CarGOData])!
    var openedResults : [CarGOData] = ([] as? [CarGOData])!
    
    var weightArray : [FilterData] = ([] as? [FilterData])!
    var selectedWeightArray : [FilterData] = ([] as? [FilterData])!
    var weightString: String = ""
    var isChoosedWeight: Bool = false
    
    var loadingTypeArray : [FilterData] = ([] as? [FilterData])!
    var selectedLoadingTypeArray : [FilterData] = ([] as? [FilterData])!
    var loadingTypeString: String = ""
    var isChoosedLoadingType: Bool = false
    
    var carGoNameArray : [FilterData] = ([] as? [FilterData])!
    var selectedCarGoNameArray : [FilterData] = ([] as? [FilterData])!
    var carGoNameString: String = ""
    var isChoosedCarGoName: Bool = false
    
    var paymentTypeArray : [FilterData] = ([] as? [FilterData])!
    var selectedPaymentTypeArray : [FilterData] = ([] as? [FilterData])!
    var paymentTypeString: String = ""
    var isChoosedPaymentType: Bool = false


    init(id: Int, carGoDataArray: [CarGOData], selectedCarGoDataArray: [CarGOData], openedResults : [CarGOData], weightArray : [FilterData], selectedWeightArray : [FilterData], loadingTypeArray : [FilterData], selectedLoadingTypeArray : [FilterData], carGoNameArray : [FilterData], selectedCarGoNameArray : [FilterData], paymentTypeArray : [FilterData], selectedPaymentTypeArray : [FilterData] ){
        self.id = id
        self.carGoDataArray = carGoDataArray
        self.selectedCarGoDataArray = selectedCarGoDataArray
        self.openedResults = openedResults
        
        self.weightArray = weightArray
        self.selectedWeightArray = selectedWeightArray
        self.loadingTypeArray = loadingTypeArray
        self.selectedLoadingTypeArray = selectedLoadingTypeArray
        self.carGoNameArray = carGoNameArray
        self.selectedCarGoNameArray = selectedCarGoNameArray
        self.paymentTypeArray = paymentTypeArray
        self.selectedPaymentTypeArray = selectedPaymentTypeArray
        
    }
    init(){
        
    }

}
