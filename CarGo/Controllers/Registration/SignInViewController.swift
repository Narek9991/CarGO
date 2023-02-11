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
    @IBOutlet weak var PhoneNumberTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var skipButton: UIButton!
    
    @IBOutlet weak var googleImageVIew: UIImageView!
    @IBOutlet weak var fbImageVIew: UIImageView!
    @IBOutlet weak var appleImageView: UIImageView!
    
    
    
    
    @IBAction func nextButton(_ sender: UIButton) {
        
    }

    @IBAction func skipButton(_ sender: UIButton) {
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurePage()
    }
    
    func configurePage() {
        mainPicture.image = UIImage(named: "truckPhoto")
        googleImageVIew.image = UIImage(named: "google")
        fbImageVIew.image = UIImage(named: "fb")
        appleImageView.image = UIImage(named: "apple")
        PhoneNumberTextField.placeholder = "Phone number"
        nextButton.titleLabel?.text = "Next"
        skipButton.titleLabel?.text = "Skip"
        
        let a = 5
    }


}

