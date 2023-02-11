//
//  SearchResultVC.swift
//  CarGo
//
//  Created by user on 2/2/23.
//

import UIKit
import NotificationCenter


class SearchResultVC: UIViewController {
    
    let notificationCenter = NotificationCenter.default
    var carGoDataArray : [CarGOData] = []
    var filterCarGoDataArray : [CarGOData] = []
    
    @IBOutlet weak var tableView: UITableView!
    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        notificationCenter.removeObserver(self)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addData()
        filterData()
        NotificationCenter.default.addObserver(self, selector: #selector(searchCarGO(notification: )), name: .sendCityNamesNC, object: nil)

        notification()
        
        self.tableView.register(UINib(nibName: "ResultTableViewCell", bundle: nil), forCellReuseIdentifier: "ResultTableViewCell")
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func notification() {
        print("yes1")
        NotificationCenter.default.addObserver(self, selector: #selector(searchCarGO(notification: )), name: .sendCityNamesNC, object: nil)
        notificationCenter.addObserver(self, selector: #selector(asa), name: .sendNC, object: nil)
        print("no1")
    }
    
    @objc func searchCarGO(notification: Notification) {
        print("yes")
        guard let cityNames = notification.userInfo as? [String : String?]
            else { return }
        
        print("notification = \(cityNames)")
    }
    @objc func asa(notification: Notification) {
        print("yes4")
    }
    
    func addData () {
        let city1 = CarGOData(initialCity: "Erevan", finalCity: "Moscow", distance: 1200, description: "22T , izoterm", info: "CocaCola", price: 2300, date: DateComponents( year: 2023, month: 03, day: 04))
        let city2 = CarGOData(initialCity: "Moscow", finalCity: "Erevan", distance: 1200, description: "22T , izoterm", info: "Pepsi", price: 3100, date: DateComponents( year: 2023, month: 03, day: 05))
       let city3 = CarGOData(initialCity: "Erevan", finalCity: "Kaliningrad", distance: 1200, description: "22T , termo", info: "tsiran", price: 2800, date: DateComponents( year: 2023, month: 03, day: 10))
       
         carGoDataArray = [city1 , city2 , city3]
        //carGoDataArray.append(<#T##NSAttributedString#>)
    }
    
    func filterData() {
        
        for i in carGoDataArray {
            if i.initialCity.lowercased() == Utils.city1.lowercased() && i.finalCity.lowercased() == Utils.city2.lowercased() {
                filterCarGoDataArray.append(i)
                print("filterCarGoDataArray = \(filterCarGoDataArray.count)")
            }
        }
    }
    
}

extension SearchResultVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print("city1 = \(Utils.city1) + city2 = \(Utils.city2)")
        if filterCarGoDataArray.isEmpty {
            return 1
        }else {
            return filterCarGoDataArray.count
        }
    }
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        print("tiv = \(indexPath.item)")
        return indexPath
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.item)")
        if indexPath.item == 8 {
            let vc = MyViewController()
            //self.present(vc, animated: true, completion: nil)
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ResultTableViewCell", for: indexPath) as? ResultTableViewCell else {
            
            return UITableViewCell()
            
        }
        
        if filterCarGoDataArray.isEmpty {
            return UITableViewCell()
        }else {
        
        let date = filterCarGoDataArray[indexPath.row].date
        
        cell.cityLabel.text = "\(filterCarGoDataArray[indexPath.row].initialCity) - \(filterCarGoDataArray[indexPath.row].finalCity)"
        cell.distanceLabel.text = String(filterCarGoDataArray[indexPath.row].distance)
        cell.descriptinLabel.text = filterCarGoDataArray[indexPath.row].description
        cell.dateAndSortLabel.text = filterCarGoDataArray[indexPath.row].info
        cell.infoLabel.text = filterCarGoDataArray[indexPath.row].info
        cell.priceLabel.text = "\(String(filterCarGoDataArray[indexPath.row].price))$"
        
        if date.month! <= 9{
        if date.day! <= 9 {
        cell.dateLabel.text = "\(date.year!).0\(date.month!).0\(date.day!)"
        }else{
            cell.dateLabel.text = "\(date.year!).0\(date.month!).\(date.day!)"
            }
        }else if date.month! >= 10{
            if date.day! <= 9 {
            cell.dateLabel.text = "\(date.year!).\(date.month!).0\(date.day!)"
            }else{
                cell.dateLabel.text = "\(date.year!).\(date.month!).\(date.day!)"
                }
            }
        }
        

        return cell
    }
}
