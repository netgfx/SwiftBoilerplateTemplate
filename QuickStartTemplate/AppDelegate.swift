//
//  AppDelegate.swift
//  QuickStartTemplate
//
//  Created by Mixalis Dobekidis on 25/6/20.
//  Copyright © 2020 Mixalis Dobekidis. All rights reserved.
//

import UIKit
import URLNavigator
import Hero

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    public var globalEvents:EventManager!
    public var window: UIWindow?
    public let navigator = Navigator()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        // Override point for customization after application launch.
        
        self.globalEvents = EventManager()
        DataManager.shared.initialize()
        
        
        return true
    }
    
    /**
     *
     */
    public func openDeepLinkURL(url:String) {
        let opened = navigator.open(url)
        if opened == false {
            if let topVC = UIApplication.getTopMostViewController() {
                if let navVC = topVC.navigationController {
                    navVC.isHeroEnabled = true
                    navVC.hero.navigationAnimationType = .autoReverse(presenting: .zoom)
                }
                else if let navVC = topVC as? UINavigationController {
                    navVC.isHeroEnabled = true
                    
                    navVC.hero.navigationAnimationType = .autoReverse(presenting: .zoom)
                }
            }
            navigator.push(url)
        }
    }
    
    func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:] ) -> Bool {
        
        let sendingAppID = options[.sourceApplication]
        print("source application = \(sendingAppID ?? "Unknown")")
        
        // Process the URL.
        guard let components = NSURLComponents(url: url, resolvingAgainstBaseURL: true),
            let path = components.path,
            let params = components.queryItems else {
                print("Invalid URL or path missing")
                return false
        }
        print(path, params)
        
        return false
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

