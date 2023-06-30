//
//  AppDelegate.swift
//  CarGo
//
//  Created by user on 6/28/22.
//

import UIKit
import GooglePlaces
import GoogleMaps


@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var scene: UIWindowScene?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        GMSPlacesClient.provideAPIKey("AIzaSyAQ_y6Xf8PM267g29EFNOcTcyaxNVtK1yU")
        GMSServices.provideAPIKey("AIzaSyAQ_y6Xf8PM267g29EFNOcTcyaxNVtK1yU")

        AddData.addData()
    
        
        
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

