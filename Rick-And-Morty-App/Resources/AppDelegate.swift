//
//  AppDelegate.swift
//  Rick-And-Morty-App
//
//  Created by Carlos Morgado on 3/7/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setUpView()
        return true
    }

    private func setUpView() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = RMTabBarViewController()
        window?.makeKeyAndVisible()
    }
    
    
}

