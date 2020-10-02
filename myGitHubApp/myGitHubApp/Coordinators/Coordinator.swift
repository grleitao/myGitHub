//
//  Coordinator.swift
//  myGitHubApp
//
//  Created by Gustavo Rodrigues Leitão on 04/08/20.
//  Copyright © 2020 Gustavo. All rights reserved.
//

import UIKit

protocol CoordinatorProtocol {
    func start()
}

class Coordinator: CoordinatorProtocol {
    
    private var window         : UIWindow?
    private var homeCoordinator: HomeCoordinator!
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    private let navigation: UINavigationController = {
        let navigationController = UINavigationController()
        navigationController.navigationBar.barTintColor  = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        navigationController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),
                                                                  NSAttributedString.Key.font :  UIFont(name: "Montserrat-Bold", size: 16) ?? UIFont.boldSystemFont(ofSize: 16)]
        navigationController.navigationBar.tintColor     = #colorLiteral(red: 0.2078431373, green: 0.2274509804, blue: 0.2509803922, alpha: 1)
        navigationController.navigationBar.isTranslucent = false
        return navigationController
     }()
    
    func start() {
        self.window?.rootViewController = navigation
        self.homeCoordinator = HomeCoordinator(navigation: navigation)
        self.homeCoordinator.start()
        self.window?.makeKeyAndVisible()
    }
}
