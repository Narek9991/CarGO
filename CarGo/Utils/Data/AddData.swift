//
//  AddData.swift
//  CarGo
//
//  Created by user on 3/21/23.
//

import Foundation
import CoreImage

class AddData {

public static func addData() {
    
    addFilterData()
    
  
    let city1 = CarGOData(initialCity: "Moscow", finalCity: "Saratov", carGoName: "Առանց ալկոհոլի խմիչքներ", distance: 1200, date: DateComponents( year: 2023, month: 03, day: 04),  carGoWeight: "22", description: "22T , izoterm", loadingType: "Կողքից", info: "CocaCola", price: 2300, paymentType: "Կանխիկ", moreInfo: "Բեռը լինելու է պլաստմասից 0.5լ. և 1լ. շշերով1:", isBookmarksSelected: false, id: 1,startCityCoordinate: CityCoordinate.moscow, finalCityCoordinate: CityCoordinate.saratov)
    let city2 = CarGOData(initialCity: "Moscow", finalCity: "Chelyabinsk", carGoName: "Խաղալիքներ", distance: 1200, date: DateComponents( year: 2023, month: 03, day: 05),  carGoWeight: "7", description: "22T , izoterm", loadingType: "Հետևից", info: "Pepsi", price: 3100, paymentType: "Կանխավճարով",moreInfo: "Բեռը լինելու է պլաստմասից 0.5լ. և 1լ. շշերով2:", isBookmarksSelected: false, id: 2,startCityCoordinate: CityCoordinate.moscow, finalCityCoordinate: CityCoordinate.chelyabinsk)
    let city3 = CarGOData(initialCity: "Kemerovo", finalCity: "Ekatirinburg", carGoName: "Միս", distance: 1200, date: DateComponents( year: 2023, month: 03, day: 10),  carGoWeight: "15", description: "22T , termo", loadingType: "Վերևից", info: "tsiran", price: 2800, paymentType: "Առանց ԱԱՀ-ի",moreInfo: "Բեռը բարձվելու է արկղերով: Թրեյլերը պետք է ունենա սառնարան1:", isBookmarksSelected: false, id: 3,startCityCoordinate: CityCoordinate.kemerovo, finalCityCoordinate: CityCoordinate.ekatirinburg)
    let city4 = CarGOData(initialCity: "Nijniy Novorod", finalCity: "Tyumen", carGoName: "Մրգեր", distance: 1200, date: DateComponents( year: 2023, month: 03, day: 10),  carGoWeight: "20", description: "22T , termo", loadingType: "Առանց դռների", info: "tsiran", price: 2800, paymentType: "Կանխիկ",moreInfo: "Բեռը բարձվելու է արկղերով: Թրեյլերը պետք է ունենա սառնարան2:", isBookmarksSelected: false, id: 4,startCityCoordinate: CityCoordinate.nijniNovgorod, finalCityCoordinate: CityCoordinate.tyumen)
    let city5 = CarGOData(initialCity: "Sankt Peterburg", finalCity: "Pyatigorsk", carGoName: "Թուղթ", distance: 1200, date: DateComponents( year: 2023, month: 03, day: 10),  carGoWeight: "10", description: "22T , termo", loadingType: "Վերևից", info: "tsiran", price: 2800,moreInfo: "Բեռը բարձվելու է արկղերով: Թրեյլերը պետք է ունենա սառնարան3:", isBookmarksSelected: false, id: 6,startCityCoordinate: CityCoordinate.sanktPeterburg, finalCityCoordinate: CityCoordinate.pyatigorsk)
    let city6 = CarGOData(initialCity: "Ekatirinburg", finalCity: "Saratov", carGoName: "Կենդանիներ", distance: 1200, date: DateComponents( year: 2023, month: 03, day: 10),  carGoWeight: "22", description: "22T , termo", loadingType: "Առանց դռների", info: "tsiran", price: 2800, paymentType: "Կանխիկ",moreInfo: "Բեռը բարձվելու է արկղերով: Թրեյլերը պետք է ունենա սառնարան4:", isBookmarksSelected: false, id: 7,startCityCoordinate: CityCoordinate.ekatirinburg, finalCityCoordinate: CityCoordinate.saratov)
    let city7 = CarGOData(initialCity: "Nijniy Novgorod", finalCity: "Sankt Peterburg", carGoName: "Կոշիկներ", distance: 1200, date: DateComponents( year: 2023, month: 03, day: 10),  carGoWeight: "12", description: "22T , termo", loadingType: "Առանց դռների", info: "tsiran", price: 2800, paymentType: "ԱԱՀ-ով",moreInfo: "Բեռը բարձվելու է արկղերով: Թրեյլերը պետք է ունենա սառնարան5:", isBookmarksSelected: false, id: 8,startCityCoordinate: CityCoordinate.nijniNovgorod, finalCityCoordinate: CityCoordinate.sanktPeterburg)
    let city8 = CarGOData(initialCity: "Moscow", finalCity: "Sankt Peterburg", carGoName: "Հագուստ", distance: 1200, date: DateComponents( year: 2023, month: 03, day: 10),  carGoWeight: "5", description: "22T , termo", loadingType: "2 Կողքերից", info: "tsiran", price: 2800, paymentType: "ԱԱՀ-ով",moreInfo: "Բեռը բարձվելու է արկղերով: Թրեյլերը պետք է ունենա սառնարան6:", isBookmarksSelected: false, id: 9,startCityCoordinate: CityCoordinate.moscow, finalCityCoordinate: CityCoordinate.sanktPeterburg)
    let city9 = CarGOData(initialCity: "Saratov", finalCity: "Moscow", carGoName: "Համակարգիչներ", distance: 1200, date: DateComponents( year: 2023, month: 03, day: 10),  carGoWeight: "15", description: "22T , termo",loadingType: "2 Կողքերից", info: "tsiran", price: 2800, paymentType: "Առանց ԱԱՀ-ի", moreInfo: "Բեռը բարձվելու է արկղերով: Թրեյլերը պետք է ունենա սառնարան7:", isBookmarksSelected: false, id: 10,startCityCoordinate: CityCoordinate.saratov, finalCityCoordinate: CityCoordinate.moscow)

        Utils.carGoDataArray = [city1, city2, city3, city4, city5, city6, city7, city8, city9]
    
    }

}

private func addFilterData() {
    let weight0 = FilterData(name: "Ընտրել", isChoosed: false, id: 0)
    let weight5 = FilterData(name: "5", isChoosed: false, id: 1)
    let weight7 = FilterData(name: "7", isChoosed: false, id: 2)
    let weight10 = FilterData(name: "10", isChoosed: false, id: 3)
    let weight12 = FilterData(name: "12", isChoosed: false, id: 4)
    let weight15 = FilterData(name: "15", isChoosed: false, id: 5)
    let weight20 = FilterData(name: "20", isChoosed: false, id: 6)
    let weight22 = FilterData(name: "22", isChoosed: false, id: 7)
        
    Utils.weightArray = [weight0, weight5, weight7, weight10, weight12, weight15, weight20, weight22]
    
    let loadingType1 = FilterData(name: "Ընտրել", isChoosed: false, id: 0)
    let loadingType2 = FilterData(name: "Առանց դռների", isChoosed: false, id: 1)
    let loadingType3 = FilterData(name: "Կողքից", isChoosed: false, id: 2)
    let loadingType4 = FilterData(name: "2 Կողքերից", isChoosed: false, id: 3)
    let loadingType5 = FilterData(name: "Վերևից", isChoosed: false, id: 4)
    let loadingType6 = FilterData(name: "Հետևից", isChoosed: false, id: 5)
    
    Utils.loadingTypeArray = [loadingType1, loadingType2, loadingType3, loadingType4, loadingType5, loadingType6]
    
    let carGoName1 = FilterData(name: "Ընտրել", isChoosed: false, id: 0)
    let carGoName2 = FilterData(name: "Ավտոմեքենա", isChoosed: false, id: 1)
    let carGoName3 = FilterData(name: "Անվադողեր", isChoosed: false, id: 2)
    let carGoName4 = FilterData(name: "Ալկոհոլային խմիչքներ", isChoosed: false, id: 3)
    let carGoName5 = FilterData(name: "Արմատուրա", isChoosed: false, id: 4)
    let carGoName6 = FilterData(name: "Առանց ալկոհոլի խմիչքներ", isChoosed: false, id: 5)
    let carGoName7 = FilterData(name: "Բանջարեղեն", isChoosed: false, id: 6)
    let carGoName8 = FilterData(name: "Դռներ", isChoosed: false, id: 7)
    let carGoName9 = FilterData(name: "Թուղթ", isChoosed: false, id: 8)
    let carGoName10 = FilterData(name: "Խաղալիքներ", isChoosed: false, id: 9)
    let carGoName11 = FilterData(name: "Կենդանիներ", isChoosed: false, id: 10)
    let carGoName12 = FilterData(name: "Կենցաղային տեխնիկա", isChoosed: false, id: 11)
    let carGoName13 = FilterData(name: "Կոշիկներ", isChoosed: false, id: 12)
    let carGoName14 = FilterData(name: "Հագուստ", isChoosed: false, id: 13)
    let carGoName15 = FilterData(name: "Համակարգիչներ", isChoosed: false, id: 14)
    let carGoName16 = FilterData(name: "Միս", isChoosed: false, id: 15)
    let carGoName17 = FilterData(name: "Մրգեր", isChoosed: false, id: 16)
    let carGoName18 = FilterData(name: "Տախտակներ", isChoosed: false, id: 17)
   
    Utils.carGoNameArray = [carGoName1, carGoName2, carGoName3, carGoName4, carGoName5, carGoName6, carGoName7, carGoName8, carGoName9, carGoName10, carGoName11, carGoName12, carGoName13, carGoName14, carGoName15, carGoName16, carGoName17, carGoName18]
    
    let paymentType1 = FilterData(name: "Ընտրել", isChoosed: false, id: 0)
    let paymentType2 = FilterData(name: "Կանխավճարով", isChoosed: false, id: 1)
    let paymentType3 = FilterData(name: "Կանխիկ", isChoosed: false, id: 2)
    let paymentType4 = FilterData(name: "ԱԱՀ-ով", isChoosed: false, id: 3)
    let paymentType5 = FilterData(name: "Առանց ԱԱՀ-ի", isChoosed: false, id: 4)
    
    
    Utils.paymentTypeArray = [paymentType1, paymentType2, paymentType3, paymentType4, paymentType5]
    
   
    
    
}


