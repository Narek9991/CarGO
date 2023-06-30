//
//  TabBarViewController.swift
//  CarGo
//
//  Created by user on 4/3/23.
//

import UIKit

class TabBarViewController: UITabBarController {

    @IBOutlet weak var uiTabBar: UITabBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.barStyle = UIBarStyle.black
        
        uiTabBar.scrollEdgeAppearance?.backgroundColor = .red
            let appearance = UITabBarAppearance()
            appearance.backgroundColor = .white
        appearance.backgroundEffect = UIBlurEffect(style: .light)
               uiTabBar.scrollEdgeAppearance = appearance
        uiTabBar.isTranslucent = true
        
    }
    

}
