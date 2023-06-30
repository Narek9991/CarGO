//
//  ViewController.swift
//  CarGo
//
//  Created by user on 6/28/22.
//

import UIKit

class SendCodeVC: UIViewController {
    
    @IBOutlet weak var codeTextField: UITextField!
    @IBOutlet weak var sencCodeView: UIView!
    
    var userDefault = UserDefaults.standard
    var phoneNumber: String = ""
    var phoneNumberArray: [PhoneNumberModel] = []
    var data: [Data] = []
    var isUsedId = false
    
    var registrationRect = CGFloat()
    var a: CGFloat = 0
    
    
    @IBAction func signInButton(_ sender: UIButton) {
        if codeTextField.text == "1" {
            addPhoneNumber()
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "TabBarViewController") as! TabBarViewController
            userDefault.set(Utils.isSuccess, forKey: "isSuccess")
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    @IBAction func sendCodeAgain(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupToHideKeyboardOnTapOnView()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:UIResponder.keyboardWillShowNotification, object: nil)
       
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if sencCodeView.center.y != registrationRect {
        self.view.endEditing(true)
        sencCodeView.center.y += a
        }
    }
    
    func addPhoneNumber() {
        
        let id: Int = .random(in: 1..<1000000)
        let a = PhoneNumberModel(number: phoneNumber, id: id)
        userDefault.phoneNumberModel.append(a)
        
        Utils.id = id
        userDefault.set(Utils.id, forKey: "Utils.id")
        
    }

}


extension SendCodeVC {
    
    @objc func keyboardWillShow (notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
                }
            }
       
    }
    
}

