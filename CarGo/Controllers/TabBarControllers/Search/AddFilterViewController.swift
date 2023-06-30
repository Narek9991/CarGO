//
//  AddFilterViewController.swift
//  CarGo
//
//  Created by user on 3/23/23.
//

import UIKit

class AddFilterViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var userDefaults = UserDefaults.standard
    
    @IBAction func okButton(_ sender: UIButton) {
        Utils.isOneLounch = false
        Utils.isOkButtonTapped = true
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        navigationController?.pushViewController(vc, animated: true)
       
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib(nibName: "FilterSearchTableViewCell", bundle: nil), forCellReuseIdentifier: "FilterSearchTableViewCell")
        hidesBottomBarWhenPushed = true
       
        

        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if self.isMovingFromParent {
            ok()
        }
    }
    
    func ok() {
        Utils.isOneLounch = false
        Utils.isOkButtonTapped = true
        Utils.isOk = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
}
    
    extension AddFilterViewController: UITableViewDelegate, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            
            if Utils.index == 0{
                return Utils.loadingTypeArray.count
            }else if Utils.index == 1 {
                return Utils.weightArray.count
            }else if Utils.index == 2 {
                return Utils.carGoNameArray.count
            }else if Utils.index == 3 {
                return Utils.paymentTypeArray.count
            }
            return section
        }
        
        func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
            print("tiv = \(indexPath.item)")
            
            return indexPath
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print("\(indexPath.item)")
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FilterSearchTableViewCell", for: indexPath) as? FilterSearchTableViewCell else {return UITableViewCell() }
            
            print("aaasss\(cell.bounds.width)")
            print("aaassstableView\(tableView.bounds.width)")
            
            
            if Utils.index == 0 {
                print("Utils.loadingTypeArray = \(Utils.loadingTypeArray)")
                cell.isChoosed = { isSuccies in
                    Utils.loadingTypeArray[indexPath.row].isChoosed = isSuccies
                    self.userDefaults.userModel.loadingTypeArray = Utils.loadingTypeArray
                    
                    if isSuccies == true {
                        Utils.selectedLoadingTypeArray.append(Utils.loadingTypeArray[indexPath.row])
                        
                        print("selectedWeightArray = \(Utils.selectedLoadingTypeArray)")
                    }else {
                        for i in 0...Utils.selectedLoadingTypeArray.count {
                            var a = 0
                            if i == 0 {
                                a = i
                            }else {
                                a = (i - 1)
                            }
                            
                            if Utils.loadingTypeArray[indexPath.row].id == Utils.selectedLoadingTypeArray[a].id {
                                Utils.selectedLoadingTypeArray.remove(at: a)
                                print("selectedWeightArray = \(Utils.selectedLoadingTypeArray)")
                                break
                            }
                        }
                    }
                    
                    print(" cell \(Utils.loadingTypeArray[indexPath.row].id) => \(Utils.loadingTypeArray[indexPath.row].isChoosed)")
                    self.userDefaults.userModel.selectedLoadingTypeArray = Utils.selectedLoadingTypeArray
                    }
                cell.setupData(item: Utils.loadingTypeArray, index: indexPath.row)

            }else if Utils.index == 1{
                
                cell.isChoosed = { isSuccies in
                    Utils.weightArray[indexPath.row].isChoosed = isSuccies
                    self.userDefaults.userModel.weightArray = Utils.weightArray
                    
                    if isSuccies == true{
                        Utils.selectedWeightArray.append(Utils.weightArray[indexPath.row])
                        print("selectedWeightArray = \(Utils.selectedWeightArray)")
                    }else {
                        for i in 0...Utils.selectedWeightArray.count {
                            var a = 0
                            if i == 0 {
                                a = i
                            }else {
                                a = (i - 1)
                            }
                            if Utils.selectedWeightArray.count >= 1{
                            if Utils.weightArray[indexPath.row].id == Utils.selectedWeightArray[a].id {
                                Utils.selectedWeightArray.remove(at: a)
                                print("selectedWeightArray = \(Utils.selectedWeightArray)")
                                break
                            }
                            }
                        }
                    }
                    
                    print(" cell \(Utils.weightArray[indexPath.row].id) => \(Utils.weightArray[indexPath.row].isChoosed)")
                    self.userDefaults.userModel.selectedWeightArray = Utils.selectedWeightArray
                    }
                
                
                cell.setupData(item: Utils.weightArray, index: indexPath.row)
            }else if Utils.index == 2 {
                cell.isChoosed = { isSuccies in
                    Utils.carGoNameArray[indexPath.row].isChoosed = isSuccies
                    self.userDefaults.userModel.carGoNameArray = Utils.carGoNameArray
                    
                    if isSuccies == true{
                        Utils.selectedCarGoNameArray.append(Utils.carGoNameArray[indexPath.row])
                        print("selectedCarGoNameArray = \(Utils.selectedCarGoNameArray)")
                    }else {
                        for i in 0...Utils.selectedCarGoNameArray.count {
                            var a = 0
                            if i == 0 {
                                a = i
                            }else {
                                a = (i - 1)
                            }
                            if Utils.selectedCarGoNameArray.count >= 1{
                            if Utils.carGoNameArray[indexPath.row].id == Utils.selectedCarGoNameArray[a].id {
                                Utils.selectedCarGoNameArray.remove(at: a)
                                print("selectedCarGoNameArray = \(Utils.selectedCarGoNameArray)")
                                break
                            }
                        }
                        }
                    }
                    
                    print(" cell \(Utils.carGoNameArray[indexPath.row].id) => \(Utils.carGoNameArray[indexPath.row].isChoosed)")
                    self.userDefaults.userModel.selectedCarGoNameArray = Utils.selectedCarGoNameArray
                    }
                
                
                cell.setupData(item: Utils.carGoNameArray, index: indexPath.row)

            }else if Utils.index == 3 {
                cell.isChoosed = { isSuccies in
                    Utils.paymentTypeArray[indexPath.row].isChoosed = isSuccies
                    self.userDefaults.userModel.paymentTypeArray = Utils.paymentTypeArray
                    
                    if isSuccies == true{
                        Utils.selectedPaymentTypeArray.append(Utils.paymentTypeArray[indexPath.row])
                        print("selectedPaymentTypeArray = \(Utils.selectedPaymentTypeArray)")
                    }else {
                        for i in 0...Utils.selectedPaymentTypeArray.count {
                            var a = 0
                            if i == 0 {
                                a = i
                            }else {
                                a = (i - 1)
                            }
                            if Utils.paymentTypeArray[indexPath.row].id == Utils.selectedPaymentTypeArray[a].id {
                                Utils.selectedPaymentTypeArray.remove(at: a)
                                print("selectedCarGoNameArray = \(Utils.selectedCarGoNameArray)")
                                break
                            }
                        }
                    }
        
                    self.userDefaults.userModel.selectedPaymentTypeArray = Utils.selectedPaymentTypeArray
                    }
                
                
                cell.setupData(item: Utils.paymentTypeArray, index: indexPath.row)
            }
            
            
           
            
            
            
            
            return cell
        }
    }
    

