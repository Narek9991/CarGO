//
//  AccountViewController.swift
//  CarGo
//
//  Created by user on 4/17/23.
//

import UIKit

class AccountViewController: UIViewController {
    
    var userDefaults = UserDefaults.standard
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBAction func saveButton(_ sender: UIButton) {
        
        saveAlert()
    }
    
    @IBAction func logOutButton(_ sender: UIButton) {
        
        logoutAlert()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupToHideKeyboardOnTapOnView()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        numberLabel.text = Utils.phoneNumber
        nameTextField.text = userDefaults.userModel.name
        
    }
    
    func saveAlert() {
        let alertController = UIAlertController(
            title: "Ցանկանում է՞ք պահպանել անունը",
            message: "",
            preferredStyle: UIAlertController.Style.actionSheet
        )
        
        let confirmAction = UIAlertAction(
            title: "OK", style: UIAlertAction.Style.default) { (action) in
                
                guard let name = self.nameTextField.text else {
                    return
                }
                
                self.userDefaults.userModel.name = name
                //alertController.dismiss(animated: true, completion: nil)
        }
        let cancelAction = UIAlertAction(
            title: "Cancel", style: .destructive) { (action) in
                alertController.dismiss(animated: true, completion: nil)
        }
        
        
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
        
    }
    
    func logoutAlert() {
        let alertController = UIAlertController(
            title: "Ցանկանում է՞ք դուրս գալ",
            message: "",
            preferredStyle: UIAlertController.Style.actionSheet
        )
        
        let confirmAction = UIAlertAction(
            title: "OK", style: UIAlertAction.Style.default) { (action) in
                
                Utils.id = 0
                self.userDefaults.set(Utils.id, forKey: "Utils.id")
                Utils.phoneNumber = ""
                self.userDefaults.set(Utils.phoneNumber,forKey: "Utils.phoneNumber")
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "SignInViewController") as? UINavigationController
                //vc.phoneNumber = phoneNumber
                self.present(vc!, animated: true)
        }
        let cancelAction = UIAlertAction(
            title: "Cancel", style: .destructive) { (action) in
                alertController.dismiss(animated: true, completion: nil)
        }
        
        
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
        
    }
    
    
    
}
