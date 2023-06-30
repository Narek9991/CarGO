//
//  SearchViewController.swift
//  CarGo
//
//  Created by user on 6/29/22.
//

import UIKit
import AudioToolbox

class SearchViewController: UIViewController{
   
    @IBOutlet weak var buttonsView: UIView!
    @IBOutlet weak var carButton: UIButton!
    @IBOutlet weak var enterCity1TextField: UITextField!
    @IBOutlet weak var enterCity2TextField: UITextField!
    @IBOutlet weak var carGoButton: UIButton!
    @IBOutlet weak var rotateImageView: UIImageView!
    @IBOutlet weak var titleTableView: UITableView!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var searchView: UIView!
    
    
    let userDefaults = UserDefaults.standard
    
    var str = ["Բարձման տեսակ", "Քաշ (տ.)", "Բեռի անվանում", "Վճարում",]

    @IBAction func searchButton(_ sender: UIButton) {
        
        addSearchParameter()
        
        Utils.startCity = enterCity1TextField.text!
        Utils.endCity = enterCity2TextField.text!
        Utils.filterCarGoDataArray.removeAll()
        
    }
    
    @IBAction func carButtonTapped(_ sender: Any) {
        
        carButton.backgroundColor = .white
        carGoButton.backgroundColor = .lightGray
        carButton.shake()
        
        
    }
    
    @IBAction func carGoButtonTapped(_ sender: Any) {
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        carButton.backgroundColor = .lightGray
        carGoButton.backgroundColor = .white
        carGoButton.shake()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //userDefaults.removeObject(forKey: "\(Utils.id)userModel")
        //UserDefaults.resetStandardUserDefaults()
        
        setupToHideKeyboardOnTapOnView()
        rotateImageView.transform = rotateImageView.transform.rotated(by: Double.pi / 2)

        
        self.tabBarController?.tabBar.backgroundColor = .white
        
        print("id:: \(Utils.id),,, idIndex\(Utils.idIndex)")
        
       
        
        
        
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        buttonsCorners()
        
        
        self.titleTableView.register(UINib(nibName: "FilterTableViewCell", bundle: nil), forCellReuseIdentifier: "FilterTableViewCell")
        
        self.titleTableView.delegate = self
        self.titleTableView.dataSource = self
        
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
        configurePage()
        
        titleTableView.reloadData()
        
        var isOk = false
        
        if userDefaults.userModel.carGoDataArray.isEmpty {
            isOk = false
        }else{
            isOk = true
        }

            
        if !isOk {
            
            userDefaults.userModel = UserModel(id: Utils.id, carGoDataArray: Utils.carGoDataArray, selectedCarGoDataArray: Utils.selectedCarGoDataArray, openedResults: Utils.openedResults, weightArray:  Utils.weightArray, selectedWeightArray: Utils.selectedWeightArray, loadingTypeArray: Utils.loadingTypeArray, selectedLoadingTypeArray: Utils.selectedLoadingTypeArray, carGoNameArray:  Utils.carGoNameArray, selectedCarGoNameArray: Utils.selectedCarGoNameArray, paymentTypeArray:  Utils.paymentTypeArray, selectedPaymentTypeArray: Utils.selectedPaymentTypeArray )
            userDefaults.userModel.isSuccess = true
            userDefaults.set(Utils.phoneNumber, forKey: "Utils.phoneNumber")
        }else {
            addData()
        }
        
       
    }
    
    
    func addData () {
        
        
//        userDefaults.removeObject(forKey: "userModel")
//        userDefaults.removeObject(forKey: "phoneNumberArray")
//        userDefaults.removeObject(forKey: "\(Utils.id)userModel")
        
        guard let phoneNumber = userDefaults.string(forKey: "Utils.phoneNumber") else {
            return
        }
        Utils.phoneNumber = phoneNumber
        
        
        let id = userDefaults.integer(forKey: "Utils.id")
        
        Utils.id = id
        
            
       let selectedCarGoDataArray = userDefaults.userModel.selectedCarGoDataArray
            Utils.selectedCarGoDataArray = selectedCarGoDataArray

        let carGoDataArray = userDefaults.userModel.carGoDataArray
            Utils.carGoDataArray = carGoDataArray
        
        let weightArray = userDefaults.userModel.weightArray
        Utils.weightArray = weightArray
        
        let selectedWeightArray = userDefaults.userModel.selectedWeightArray
        Utils.selectedWeightArray = selectedWeightArray
        
        let loadingTypeArray = userDefaults.userModel.loadingTypeArray
        Utils.loadingTypeArray = loadingTypeArray
        
        let selectedLoadingTypeArray = userDefaults.userModel.selectedLoadingTypeArray
        Utils.selectedLoadingTypeArray = selectedLoadingTypeArray
        
        let carGoNameArray = userDefaults.userModel.carGoNameArray
        Utils.carGoNameArray = carGoNameArray
        
        let selectedCarGoNameArray = userDefaults.userModel.selectedCarGoNameArray
        Utils.selectedCarGoNameArray = selectedCarGoNameArray

        let paymentTypeArray = userDefaults.userModel.paymentTypeArray
        Utils.paymentTypeArray = paymentTypeArray
        
        let selectedPaymentTypeArray = userDefaults.userModel.selectedPaymentTypeArray
        Utils.selectedPaymentTypeArray = selectedPaymentTypeArray
        
        let loadingTypeString = userDefaults.userModel.loadingTypeString
        Utils.loadingTypeString = loadingTypeString
        
        let weightString = userDefaults.userModel.weightString
        Utils.weightString = weightString
        
        let carGoNameString = userDefaults.userModel.carGoNameString
        Utils.carGoNameString = carGoNameString
        
        let paymentTypeString = userDefaults.userModel.paymentTypeString
        Utils.paymentTypeString = paymentTypeString
    
    }
    
    func configurePage() {
        
        addGestureToRotateImage()

        self.view.backgroundColor = Utils.appColor
        carButton.backgroundColor = .white
        carGoButton.backgroundColor = .lightGray
        carButton.titleLabel?.font = UIFont(name: "Helvetica", size: 11)
        carGoButton.titleLabel?.font = UIFont(name: "Helvetica", size: 11)
        
    }
    
    func buttonsCorners() {
        
        searchView.roundCorners(corners: .allCorners, radius: searchView.bounds.height / 4)
        searchButton.roundCorners(corners: .allCorners, radius: searchButton.bounds.height / 4)
        buttonsView.roundCorners(corners: .allCorners, radius: buttonsView.bounds.height / 2)
        self.carButton.roundCorners(corners: [.allCorners], radius: carButton.bounds.height / 2)
        self.carGoButton.roundCorners(corners: [.allCorners], radius: carGoButton.bounds.height / 2)
        rotateImageView.roundCorners(corners: [.topLeft,.bottomLeft, .topRight, .bottomRight], radius: rotateImageView.bounds.height / 2)
        rotateImageView.roundCorners(corners: [.topLeft,.topRight, .bottomLeft, .bottomRight], radius: rotateImageView.bounds.width / 2)
    }
    
    func addFilterParam(array: [FilterData], string: inout String, bool: inout Bool, userDefaultString: inout String) {
        if !array.isEmpty {
            string = ""
            userDefaultString = ""
            for i in 0...array.count {
                if i == array.count {
                    break
                }else{
                    string += "\(array[i].name), "
                    userDefaults.set(string, forKey: "string")
                    Utils.filterDataArray.append(array[i])
                }
            }
            Utils.isOkButtonTapped = false
            bool = true
            userDefaults.set(bool, forKey: "bool")
            
        }else{
            string = ""
            bool = false
            Utils.isOkButtonTapped = false
            userDefaults.set(bool, forKey: "bool")
        }
        
        
    }
    
    func addFilterData(array: [FilterData]) {
        if !array.isEmpty {
            for i in 0...array.count {
                if i == array.count {
                    break
                }else{
                    Utils.filterDataArray.append(array[i])
                }
            }
        }
        
    }
    
    func addSearchParameter() {
        Utils.filterDataArray.removeAll()
        addFilterData(array: Utils.selectedLoadingTypeArray)
        addFilterData(array: Utils.selectedWeightArray)
        addFilterData(array: Utils.selectedCarGoNameArray)
        addFilterData(array: Utils.selectedPaymentTypeArray)
    }
    
    func addGestureToRotateImage() {
        
        
        self.rotateImageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(rotateCityNames(_:)))
        self.rotateImageView.addGestureRecognizer(tap)
    }
    
    @objc func rotateCityNames(_ tapGesture: UITapGestureRecognizer) {
        
        let name = enterCity1TextField.text
        enterCity1TextField.text = enterCity2TextField.text
        enterCity2TextField.text = name
        
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return str.count
    }
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        print("tiv = \(indexPath.item)")
        
        Utils.index = indexPath.row
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AddFilterViewController") as! AddFilterViewController

        navigationController?.pushViewController(vc, animated: true)
        
       
        return indexPath
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FilterTableViewCell", for: indexPath) as? FilterTableViewCell else {
            
            return UITableViewCell()
            
        }
        
        
        print("aaasss\(cell.bounds.width)")
        print("aaassstableView\(tableView.bounds.width)")
        
        if Utils.isOneLounch {
            //cell.titleLabel?.text = str[indexPath.row]
        }
        
        if Utils.isOkButtonTapped {
            if Utils.selectedLoadingTypeArray.isEmpty {
                Utils.isOkButtonTapped = false
            }
            if Utils.index == 0{
                addFilterParam(array: Utils.selectedLoadingTypeArray, string: &Utils.loadingTypeString, bool: &Utils.isChoosedLoadingType, userDefaultString: &userDefaults.userModel.loadingTypeString)
                userDefaults.userModel.loadingTypeString = Utils.loadingTypeString
                tableView.reloadData()
                
            } else if Utils.index == 1{
                addFilterParam(array: Utils.selectedWeightArray, string: &Utils.weightString, bool: &Utils.isChoosedWeight, userDefaultString: &userDefaults.userModel.weightString)
                userDefaults.userModel.weightString = Utils.weightString
                tableView.reloadData()
                
            } else if Utils.index == 2{
                addFilterParam(array: Utils.selectedCarGoNameArray, string: &Utils.carGoNameString, bool: &Utils.isChoosedCarGoName, userDefaultString: &userDefaults.userModel.carGoNameString)
                userDefaults.userModel.carGoNameString = Utils.carGoNameString
                tableView.reloadData()
                    
            } else if Utils.index == 3{
                addFilterParam(array: Utils.selectedPaymentTypeArray, string: &Utils.paymentTypeString, bool: &Utils.isChoosedPaymentType, userDefaultString: &userDefaults.userModel.paymentTypeString)
                userDefaults.userModel.paymentTypeString = Utils.paymentTypeString
                tableView.reloadData()

            }
        }else{
            str = ["Բարձման տեսակ", "Քաշ (տ.)", "Բեռի անվանում", "Վճարում",]
        }
        

        print("Utils.loadingTypeString:: \(Utils.loadingTypeString)")
        if !Utils.loadingTypeString.isEmpty {
            str[0] = Utils.loadingTypeString
        }
        print("Utils.weightString:: \(Utils.weightString)")
        if !Utils.weightString.isEmpty {
            str[1] = Utils.weightString
        }
        
        print("Utils.carGoNameString:: \(Utils.carGoNameString)")
        if !Utils.carGoNameString.isEmpty {
            str[2] = Utils.carGoNameString
        }
        
        print("Utils.paymentTypeString:: \(Utils.paymentTypeString)")
        if !Utils.paymentTypeString.isEmpty {
            str[3] = Utils.paymentTypeString
        }
        
        cell.titleLabel?.text = str[indexPath.row]
        
        return cell
    }
}

