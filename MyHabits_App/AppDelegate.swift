//
//  AppDelegate.swift
//  MyHabits_App
//
//  Created by Arthur Raff on 08.11.2020.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    private var appCoordinator: AppCoordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let controller = TabBarViewController()
        appCoordinator = AppCoordinator(navigation: controller)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = appCoordinator?.tabBarController
        window?.makeKeyAndVisible()
        appCoordinator?.start()
        
        return true
    }
}

