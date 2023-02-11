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
    
    @IBAction func myCarsTapped(_ sender: Any) {

        self.myCars.backgroundColor = .white
        self.myCarGO.backgroundColor = .lightGray
        myCars.shake()
    }
    
    @IBAction func myCarGoTapped(_ sender: Any) {
        
        self.myCarGO.backgroundColor = .white
        self.myCars.backgroundColor = .lightGray
        myCarGO.shake()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        
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
