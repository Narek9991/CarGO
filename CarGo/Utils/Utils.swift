//
//  Utils.swift
//  CarGo
//
//  Created by user on 6/30/22.
//

import UIKit

class Utils {
    
    public static let appColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
    public static var isMoscowToArmenia = false
    public static var isArmeniaToMoscow = false
    public static var isAaToBb = false
    public static var isOkButtonTapped = false
    public static var isOneLounch = true
    public static var startCity = ""
    public static var endCity = ""
    public static var index = 01
    public static var moreInfo : [String] = []
    public static var carGoDataArray : [CarGOData] = []
    public static var selectedCarGoDataArray : [CarGOData] = []
    public static var filterCarGoDataArray : [CarGOData] = []
    public static var filterDataArray : [FilterData] = []
    public static var isOk = false
    
    public static var id = 0
    public static var idIndex = 0
    public static var phoneNumber = ""
    public static var isSuccess = false

    
    
    public static var openedResults : [CarGOData] = []
    
    
    
    public static var weightArray : [FilterData] = []
    public static var selectedWeightArray : [FilterData] = []
    public static var weightString: String = ""
    public static var isChoosedWeight: Bool = false
    
    public static var loadingTypeArray : [FilterData] = []
    public static var selectedLoadingTypeArray : [FilterData] = []
    public static var loadingTypeString: String = ""
    public static var isChoosedLoadingType: Bool = false
    
    public static var carGoNameArray : [FilterData] = []
    public static var selectedCarGoNameArray : [FilterData] = []
    public static var carGoNameString: String = ""
    public static var isChoosedCarGoName: Bool = false
    
    public static var paymentTypeArray : [FilterData] = []
    public static var selectedPaymentTypeArray : [FilterData] = []
    public static var paymentTypeString: String = ""
    public static var isChoosedPaymentType: Bool = false
    


}
