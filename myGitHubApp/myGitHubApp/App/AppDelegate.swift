//
//  AppDelegate.swift
//  myGitHubApp
//
//  Created by Gustavo Rodrigues Leitão on 04/08/20.
//  Copyright © 2020 Gustavo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    private var coordinator: Coordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.coordinator = Coordinator(window: window)
        self.coordinator.start()
        
        return true
    }
}
