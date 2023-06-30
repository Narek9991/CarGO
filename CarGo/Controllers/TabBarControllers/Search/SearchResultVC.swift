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
    var isEmptyLabel = true
    var userDefaults = UserDefaults.standard
   
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.tableView.register(UINib(nibName: "ResultTableViewCell", bundle: nil), forCellReuseIdentifier: "ResultTableViewCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.allowsMultipleSelection = true
        filterData()
        
        print("userDefaults.userModel: \(userDefaults.userModel)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
      
        tableView.reloadData()
    }
    

    
    func filterData() {
        
        Utils.carGoDataArray.forEach{ print(" Utils.carGoDataArray index \($0.id) => \($0.isBookmarksSelected)") }
        for i in Utils.carGoDataArray {
            if Utils.startCity.isEmpty || Utils.endCity.isEmpty {
                if i.initialCity.lowercased() == Utils.startCity.lowercased() || i.finalCity.lowercased() == Utils.endCity.lowercased() {
                    if !Utils.filterDataArray.isEmpty{
                        for j in Utils.filterDataArray {
                            if j.name == i.carGoName || j.name == i.carGoWeight || j.name == i.loadingType || j.name == i.paymentType{
                                Utils.filterCarGoDataArray.append(i)
                                break
                                for k in Utils.filterCarGoDataArray {
                                    for b in Utils.carGoDataArray {
                                        if k.id == b.id{
                                            continue
                                        } else {
                                            Utils.moreInfo.append(i.moreInfo)
                                            Utils.filterCarGoDataArray.append(i)
                                            print("filterCarGoDataArray = \(Utils.filterCarGoDataArray.count)")
                                        }
                                    }
                                }
                            }
                        }
                    }else {
                    Utils.moreInfo.append(i.moreInfo)
                    Utils.filterCarGoDataArray.append(i)
                    print("filterCarGoDataArray = \(Utils.filterCarGoDataArray.count)")
                    }
                }
            } else if i.initialCity.lowercased() == Utils.startCity.lowercased() && i.finalCity.lowercased() == Utils.endCity.lowercased() {
                if !Utils.filterDataArray.isEmpty{
                    for j in Utils.filterDataArray {
                        if j.name == i.carGoName || j.name == i.carGoWeight || j.name == i.loadingType || j.name == i.paymentType{
                            Utils.filterCarGoDataArray.append(i)
                            break
                            for k in Utils.filterCarGoDataArray {
                                for b in Utils.carGoDataArray {
                                    if k.id == b.id{
                                        continue
                                    } else {
                                        Utils.moreInfo.append(i.moreInfo)
                                        Utils.filterCarGoDataArray.append(i)
                                        print("filterCarGoDataArray = \(Utils.filterCarGoDataArray.count)")
                                    }
                                }
                            }
                        }
                    }
                }else {
                Utils.moreInfo.append(i.moreInfo)
                Utils.filterCarGoDataArray.append(i)
                print("filterCarGoDataArray = \(Utils.filterCarGoDataArray.count)")
                }
            }
            
           
        }
        tableView.reloadData()
        Utils.filterCarGoDataArray.forEach{ print(" filterCarGoDataArray index \($0.id) => \($0.isBookmarksSelected)") }
    }
    
    
}

extension SearchResultVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        

        return Utils.filterCarGoDataArray.isEmpty ? 1 : Utils.filterCarGoDataArray.count
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        print("tiv = \(indexPath.item)")
        
        if Utils.startCity.isEmpty  && Utils.endCity.isEmpty {
            return indexPath
        } else {
            if isEmptyLabel == true {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "ShowMoreInfoViewController") as! ShowMoreInfoViewController

                
                vc.model = Utils.filterCarGoDataArray[indexPath.row]
            Utils.openedResults.append(Utils.filterCarGoDataArray[indexPath.row])
                userDefaults.userModel.openedResults = Utils.openedResults
            print("counttt = \(Utils.moreInfo.count)")
                print("Utils.openedResults = \(Utils.openedResults)")
            navigationController?.pushViewController(vc, animated: true)
            }
        }
        
        return indexPath
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.item)")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ResultTableViewCell", for: indexPath) as? ResultTableViewCell else {
            
            return UITableViewCell()
            
        }
        cell.selectionStyle = .none
        cell.isFavorite = { isSuccies in
            Utils.filterCarGoDataArray[indexPath.row].isBookmarksSelected = isSuccies
            if let index = Utils.carGoDataArray.firstIndex(where: {$0.id == Utils.filterCarGoDataArray[indexPath.row].id}) {
                Utils.carGoDataArray[index].isBookmarksSelected = isSuccies
                if isSuccies == true {
                    Utils.selectedCarGoDataArray.append(Utils.filterCarGoDataArray[indexPath.row])
                    print("count === \(Utils.selectedCarGoDataArray.count)")
                }else{
                    for i in 0..<Utils.selectedCarGoDataArray.count {
                        if Utils.filterCarGoDataArray[indexPath.row].id == Utils.selectedCarGoDataArray[i].id {
                            Utils.selectedCarGoDataArray.remove(at: i)
                            print("count == \(Utils.selectedCarGoDataArray.count)")
                            break
                        }
                    }
                }
            }
            
            self.userDefaults.userModel.carGoDataArray = Utils.carGoDataArray
            
            self.userDefaults.userModel.selectedCarGoDataArray = Utils.selectedCarGoDataArray
            

        }
        
        
        if Utils.filterCarGoDataArray.isEmpty {
            cell.emptyResult(true)
            cell.emptyResultLabel.text = "Ցավոք որոնման արդյունքում ոչինչ չի գտնվել"
            isEmptyLabel = false
        } else {
            let item = Utils.filterCarGoDataArray[indexPath.row]
            cell.setupData(item: item)
            cell.emptyResult(false)
            isEmptyLabel = true
        }
        
        return cell
    }
}
