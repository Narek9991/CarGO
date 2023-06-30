//
//  MyViewController.swift
//  CarGo
//
//  Created by user on 1/16/23.
//

import UIKit

class MyViewController: UIViewController {

    @IBOutlet weak var myCars: UIButton!
    @IBOutlet weak var myCarGO: UIButton!
    @IBOutlet weak var buttonsView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var userDefaults = UserDefaults.standard
    
    @IBAction func myCarsTapped(_ sender: Any) {

        self.myCars.backgroundColor = .white
        self.myCarGO.backgroundColor = .lightGray
        myCars.shake()
    }
    
    @IBAction func myCarGoTapped(_ sender: Any) {
        
        self.myCars.backgroundColor = .lightGray
        self.myCarGO.backgroundColor = .white
        myCarGO.shake()
    }
    
//    @IBAction func carButtonTapped(_ sender: Any) {
//
//            carButton.backgroundColor = .white
//            carGoButton.backgroundColor = .lightGray
//            carButton.shake()
//
//
//        }
//
//        @IBAction func carGoButtonTapped(_ sender: Any) {
//            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
//            carButton.backgroundColor = .lightGray
//            carGoButton.backgroundColor = .white
//            carGoButton.shake()
//
//        }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib(nibName: "ResultTableViewCell", bundle: nil), forCellReuseIdentifier: "ResultTableViewCell")
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.allowsMultipleSelection = true
        
       
        
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        navigationController?.setNavigationBarHidden(true, animated: animated)
        configure()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    func  configure() {

        buttonsCorners()
        
        self.myCars.backgroundColor = .white
        self.myCarGO.backgroundColor = .lightGray
        
    }
    
    func buttonsCorners() {

        buttonsView.roundCorners(corners: .allCorners, radius: buttonsView.bounds.height / 2)
        self.myCars.roundCorners(corners: [.allCorners], radius: myCars.bounds.height / 2)
        self.myCarGO.roundCorners(corners: [.allCorners], radius: myCarGO.bounds.height / 2)
    }

}

extension MyViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //guard let selected = userDefaults.userModel[Utils.idIndex].selectedCarGoDataArray as? [CarGOData] else  {return 0}
        return Utils.selectedCarGoDataArray.isEmpty ? 1 : Utils.selectedCarGoDataArray.count
        //return Utils.selectedCarGoDataArray.count
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "ShowMoreInfoViewController") as! ShowMoreInfoViewController
        vc.model = Utils.selectedCarGoDataArray[indexPath.row]
        print("counttt = \(Utils.moreInfo.count)")
        //hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
        
        return indexPath
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.item)")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ResultTableViewCell", for: indexPath) as? ResultTableViewCell else {
            
            return UITableViewCell()
            
        }
        //var userModel = userDefaults.userModel[Utils.idIndex]
        cell.selectionStyle = .none
        
        cell.isFavorite = { isSuccies in
                if isSuccies == false {
                    if let index = Utils.carGoDataArray.firstIndex(where: {$0.id == Utils.selectedCarGoDataArray[indexPath.row].id}) {
                    Utils.carGoDataArray[index].isBookmarksSelected = isSuccies
                        
                    }
                    
                    Utils.selectedCarGoDataArray.remove(at: indexPath.row)
                    print("count == \(Utils.selectedCarGoDataArray.count)")
                    tableView.reloadData()
                }
//            self.userDefaults.userModel[Utils.idIndex].carGoDataArray = Utils.carGoDataArray
//            self.userDefaults.userModel[Utils.idIndex].selectedCarGoDataArray = Utils.selectedCarGoDataArray
            
            self.userDefaults.userModel.carGoDataArray = Utils.carGoDataArray
            self.userDefaults.userModel.selectedCarGoDataArray = Utils.selectedCarGoDataArray
            
        }
        
        if Utils.selectedCarGoDataArray.isEmpty {
            cell.emptyResult(true)
            cell.emptyResultLabel.text = "Ցավոք որոնման արդյունքում ոչինչ չի գտնվել"
        } else {
            let item = Utils.selectedCarGoDataArray[indexPath.row]
            cell.setupData(item: item)
            cell.emptyResult(false)
        }
        
        
        return cell
    }
}

