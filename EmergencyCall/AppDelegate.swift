//
//  AppDelegate.swift
//  EmergencyCall
//
//  Created by Syed  Rafay on 17/05/2018.
//  Copyright © 2018 Syed  Rafay. All rights reserved.
//

import UIKit
import Firebase
import IQKeyboardManagerSwift
import SwiftKeychainWrapper
import GoogleMaps
import GooglePlaces
import MapKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
       
        IQKeyboardManager.sharedManager().enable = true
        GMSServices.provideAPIKey("AIzaSyAH9fC8LHuE2KDT0B5Dikk-Vh1gBtInG7c")
        GMSPlacesClient.provideAPIKey("AIzaSyAH9fC8LHuE2KDT0B5Dikk-Vh1gBtInG7c")
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        var initialViewController: UIViewController
        
        print(KEY_UID)
        if let _ = KeychainWrapper.defaultKeychainWrapper.string(forKey: KEY_UID)//your condition if user is already logged in or not
        {
            // if already logged in then redirect to MainViewController
            
            
            print("if Chal gaya")
            initialViewController = mainStoryboard.instantiateViewController(withIdentifier: "toHome") as! MapViewController // 'MainController' is the storyboard id of MainViewController
        }
        else
        {
            print("else Chal gaya")
            //If not logged in then show LoginViewController
            initialViewController = mainStoryboard.instantiateViewController(withIdentifier: "toosignin") as! ViewController // 'LoginController' is the storyboard id of LoginViewController
            
        }
        self.window?.rootViewController = initialViewController
        
        self.window?.makeKeyAndVisible()
        
        
        // Override point for customization after application launch.
        FirebaseApp.configure()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
  
}

