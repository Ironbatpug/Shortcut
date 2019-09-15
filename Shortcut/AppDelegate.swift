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
        
        let oceanShortCut = UIMutableApplicationShortcutItem(type: "\(Bundle.main.bundleIdentifier).ocean", localizedTitle: "Ocean", localizedSubtitle: nil, icon: UIApplicationShortcutIcon.init(templateImageName: "OceanShort"), userInfo: nil)
        
        application.shortcutItems = [oceanShortCut]
        
        return true
    }

    enum ShortCutType: String {
        case mountains = "mountains"
        case space = "space"
        case ocean = "ocean"
    }
    
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        if let type = shortcutItem.type.components(separatedBy: ".").last {
            
            let tabVC = window?.rootViewController as! UITabBarController
            tabVC.setViewControllers(vcsArray, animated: false)
            
            switch type {
            case ShortCutType.space.rawValue:
                tabVC.selectedIndex = 1
                completionHandler(true)
            case ShortCutType.ocean.rawValue:
                tabVC.selectedIndex = 2
                completionHandler(true)
            default:
                tabVC.selectedIndex = 0
                completionHandler(true)
            }
        }
        completionHandler(false)
    }


}

