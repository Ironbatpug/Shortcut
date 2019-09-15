//
//  AppDelegate.swift
//  Shortcut
//
//  Created by Molnár Csaba on 2019. 09. 15..
//  Copyright © 2019. Molnár Csaba. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var vcsArray = [UIViewController]()

    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mountainsVC = storyboard.instantiateViewController(withIdentifier: "mountainsVC") as! MountainVC
        let spaceVC = storyboard.instantiateViewController(withIdentifier: "spaceVC") as! SpaceVC
        let oceanVC = storyboard.instantiateViewController(withIdentifier: "oceanVC") as! OceanVC
        
        vcsArray = [mountainsVC, spaceVC, oceanVC]
        
        return true
    }

    enum ShortCutType: String {
        case mountains = "mountains"
        case space = "space"
        case ocean = "ocean"
    }
    
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        if let type = shortcutItem.type.components(separatedBy: ".").last {
            
            let navVC = window?.rootViewController as! UINavigationController
            navVC.setViewControllers(vcsArray, animated: false)
            
            switch type {
            case ShortCutType.space.rawValue:
                navVC.popToViewController(vcsArray[1], animated: true)
                completionHandler(true)
            case ShortCutType.ocean.rawValue:
                navVC.popToViewController(vcsArray[2], animated: true)
                completionHandler(true)
            default:
                navVC.popToViewController(vcsArray[0], animated: true)
                completionHandler(true)
            }
        }
        completionHandler(false)
    }


}

