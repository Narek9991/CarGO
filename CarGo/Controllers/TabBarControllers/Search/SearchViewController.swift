//
//  SearchViewController.swift
//  CarGo
//
//  Created by user on 6/29/22.
//

import UIKit
import AudioToolbox
import GooglePlaces
import NotificationCenter

class SearchViewController: UIViewController{
   


    @IBOutlet weak var buttonsView: UIView!
    @IBOutlet weak var carButton: UIButton!
    @IBOutlet weak var enterCity1TextField: UITextField!
    @IBOutlet weak var enterCity2TextField: UITextField!
    @IBOutlet weak var carGoButton: UIButton!
    @IBOutlet weak var rotateImageView: UIImageView!
    @IBOutlet weak var titleTableView: UITableView!
    @IBOutlet weak var searchButton: UIButton!
    
    let notificationCenter = NotificationCenter.default
    let str : [Int : String] = [0 : "a",
                                1 : "b",
                                2 : "c",
                                3 : "d",
                                4 : "e",
                                5 : "f",
                                6 : "h",
                                7 : "i",
                                8 : "j"]
    
    @IBAction func searchButton(_ sender: UIButton) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "SearchResultVC") as! SearchResultVC
//        vc.navigationItem.leftBarButtonItem = navigationItem.backBarButtonItem
//        let backItem = UIBarButtonItem()
//        backItem.title = "back"
//        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backItem
//        self.present(vc, animated: true)
//        //self.navigationController?.pushViewController(vc, animated: true)
        self.tabBarController?.tabBar.isHidden = true
        
        let dict = ["City1" : enterCity1TextField.text,
                    "City2" : enterCity2TextField.text]
        notificationCenter.post(name: NSNotification.Name.sendCityNamesNC, object: self, userInfo: dict)
        notificationCenter.post(name: NSNotification.Name.sendNC, object: self)
//        if enterCity1TextField.text == "Erevan" && enterCity2TextField.text == "Moscow" {
//            Utils.isArmeniaToMoscow = true
//        }
        Utils.city1 = enterCity1TextField.text!
        Utils.city2 = enterCity2TextField.text!
        
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
        configurePage()
        self.titleTableView.register(UINib(nibName: "FilterTableViewCell", bundle: nil), forCellReuseIdentifier: "FilterTableViewCell")
        
        self.titleTableView.delegate = self
        self.titleTableView.dataSource = self
        
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func configurePage() {
        buttonsCorners()
        addGestureToCity1()
        addGestureToRotateImage()
        self.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)

        self.view.backgroundColor = Utils.appColor
        carButton.backgroundColor = .white
        carGoButton.backgroundColor = .lightGray
        carButton.titleLabel?.font = UIFont(name: "Helvetica", size: 11)
        carGoButton.titleLabel?.font = UIFont(name: "Helvetica", size: 11)
        rotateImageView.transform = rotateImageView.transform.rotated(by: Double.pi / 2)
    }
    
    func buttonsCorners() {
        
        searchButton.roundCorners(corners: .allCorners, radius: searchButton.bounds.height / 2)
        buttonsView.roundCorners(corners: .allCorners, radius: buttonsView.bounds.height / 2)
        self.carButton.roundCorners(corners: [.allCorners], radius: carButton.bounds.height / 2)
        self.carGoButton.roundCorners(corners: [.allCorners], radius: carGoButton.bounds.height / 2)
        rotateImageView.roundCorners(corners: [.topLeft,.bottomLeft, .topRight, .bottomRight], radius: rotateImageView.bounds.height / 2)
        rotateImageView.roundCorners(corners: [.topLeft,.topRight, .bottomLeft, .bottomRight], radius: rotateImageView.bounds.width / 2)
    }
    
    func addGestureToCity1() {
        self.enterCity1TextField.isUserInteractionEnabled = true
        
//        let tap = UITapGestureRecognizer(target: self, action: #selector(self.searchAddresses(_:)))
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.searchAddresses(_:)))
        
        //self.enterCity1TextField.addGestureRecognizer(tap)
    }
    
    @objc func searchAddresses(_ tapGesture: UITapGestureRecognizer) {
        
//        let autocompletecontroller = GMSAutocompleteViewController()
//                autocompletecontroller.delegate = self
//                let filter = GMSAutocompleteFilter()
//                filter.type = .city  //suitable filter type
//                  //appropriate country code
//                autocompletecontroller.autocompleteFilter = filter
//                self.present(autocompletecontroller, animated: true, completion: nil)
//        
//        let autocompleteFilter = GMSAutocompleteFilter()
//        autocompleteFilter.type = GMSPlacesAutocompleteTypeFilter.city
//        GMSPlacesClient.autocom
//        let parentView = self.parent as! TravelRequestVC

        let autocompleteController = GMSAutocompleteViewController()
        autocompleteController.delegate = self
        autocompleteController.modalPresentationStyle = .fullScreen
        // Specify the place data types to return.

        let fields: GMSPlaceField = GMSPlaceField(rawValue: UInt(GMSPlaceField.name.rawValue) |
                                                  UInt(GMSPlaceField.placeID.rawValue) |  UInt(GMSPlaceField.coordinate.rawValue) )
        autocompleteController.placeFields = fields
    
        present(autocompleteController, animated: true, completion: nil)
    }
    
    func addGestureToRotateImage() {
        
        
        self.rotateImageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(rotateCityNames(_:)))
        self.rotateImageView.addGestureRecognizer(tap)
    }
    
    @objc func rotateCityNames(_ tapGesture: UITapGestureRecognizer) {
        
        var name = enterCity1TextField.text
        enterCity1TextField.text = enterCity2TextField.text
        enterCity2TextField.text = name
        print("city1 = \(enterCity1TextField.text); city2 = \(enterCity2TextField.text)")
        
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return str.count
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
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FilterTableViewCell", for: indexPath) as? FilterTableViewCell else {
            
            return UITableViewCell()
            
        }
        
        
        cell.titleLabel?.text = str[indexPath.row]
        
        
        return cell
    }
    
    
    
    
}

extension SearchViewController: GMSAutocompleteViewControllerDelegate  {
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        print("complete")
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        print("failed")
    }
    
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        dismiss(animated: true, completion: nil)
    }
}

extension NSNotification.Name {
    
    static let sendCityNamesNC = NSNotification.Name.init("sendCityNamesNC")
    static let sendNC = NSNotification.Name.init("sendNC")
    
}
