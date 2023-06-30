//
//  SignInViewController.swift
//  CarGo
//
//  Created by user on 6/28/22.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var mainPicture: UIImageView!
    @IBOutlet weak var registerView: UIView!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    let userDefaults = UserDefaults.standard
    var phoneNumberArray: [String] = []
    var isAppropriate = false
    
    var registrationRect = CGRect()
    var a: CGFloat = 0
    
    
    @IBAction func nextButton(_ sender: UIButton) {
        
        
        guard let phoneNumber = phoneNumberTextField.text else {return}
        
        
        
        if !phoneNumber.isEmpty {
            
            phoneNumberSearch()
            
            if isAppropriate {
                
                //userDefault.userModel[Utils.idIndex].id = Utils.id
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "TabBarViewController") as! TabBarViewController
                userDefaults.set(phoneNumber, forKey: "Utils.phoneNumber")
                self.present(vc, animated: true, completion: nil)
            } else {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "SendCodeVC") as! SendCodeVC
                vc.phoneNumber = phoneNumber
                navigationController?.pushViewController(vc, animated: true)
            }
        
        }else{
            alertAction()
        }
        
    }

    func alertAction() {
        let alertController = UIAlertController(
            title: "Invalid number",
            message: "Please enter phone number",
            preferredStyle: UIAlertController.Style.alert
        )
        
        let confirmAction = UIAlertAction(
            title: "OK", style: UIAlertAction.Style.default) { (action) in
                alertController.dismiss(animated: true, completion: nil)
        }
        
        alertController.addAction(confirmAction)
        
        present(alertController, animated: true, completion: nil)
        
    }
    
    
    func phoneNumberSearch() {
        guard let phoneNumber = phoneNumberTextField.text else {return}
        
        guard let number = userDefaults.phoneNumberModel as? [PhoneNumberModel] else {return}
        Utils.phoneNumber = phoneNumber
        
        for i in 0..<number.count {
            var a = number[i]
            if phoneNumber == a.number {
                
                Utils.id = a.id
                userDefaults.set(Utils.id, forKey: "Utils.id")
                //Utils.idIndex = i
                isAppropriate = true
                break
            }else{
                isAppropriate = false
            }
        }

        
    }

    @IBAction func skipButton(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TabBarViewController") as! TabBarViewController
        self.present(vc, animated: true, completion: nil)
        //userDefault.string(forKey: "phoneNumberTextField")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Utils.id:: \(userDefaults.integer(forKey: "Utils.id"))")
        print("Utils.phonenumber!!  \(Utils.phoneNumber)")
        setupToHideKeyboardOnTapOnView()

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:UIResponder.keyboardWillShowNotification, object: nil)
        //NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:UIResponder.keyboardWillHideNotification, object: nil)
        
        
        configurePage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
               
        
        guard let phoneNumber = phoneNumberTextField.text else {return }
        print("phonenumberModel!!!  \(phoneNumber)")
        
        Utils.phoneNumber = userDefaults.string(forKey: "Utils.phoneNumber") ?? ""
        print("phonenumberModel!!!1  \(Utils.phoneNumber)")
        
        if !Utils.phoneNumber.isEmpty{
        isSuccess()
        }
            
    }

//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if registerView.center.y != registrationRect {
//        self.view.endEditing(true)
//        registerView.center.y += a
//        }
//    }
    
    func isSuccess() {
        let id = userDefaults.integer(forKey: "Utils.id")
        
        guard let phoneNumber = phoneNumberTextField.text else {return}
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if id != 0 {
            
            let vc = storyboard.instantiateViewController(withIdentifier: "TabBarViewController") as! TabBarViewController
        
            self.present(vc, animated: true, completion: nil)

        }else {
            let vc = storyboard.instantiateViewController(withIdentifier: "SendCodeVC") as! SendCodeVC
            vc.phoneNumber = Utils.phoneNumber
            navigationController?.pushViewController(vc, animated: true)

        }
    }
    
    func configurePage() {
        mainPicture.image = UIImage(named: "truckPhoto")
        nextButton.titleLabel?.text = "Next"
        
        //registrationRect = CGRect(x: registerView.center.x, y: registerView.center.y, width: registerView.frame.width, height: registerView.frame.height)
        registrationRect = registerView.frame
        
    }

}

extension SignInViewController {
    
    @objc func keyboardWillShow (notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
                }
            }

    }
    
}



extension UIViewController
{
    func setupToHideKeyboardOnTapOnView(){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))

        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard(){
        
        if view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
            }
        
        view.endEditing(true)
    }
}





