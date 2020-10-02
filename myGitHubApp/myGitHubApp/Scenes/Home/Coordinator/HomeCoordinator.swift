//
//  HomeCoordinator.swift
//  myGitHubApp
//
//  Created by Gustavo Rodrigues Leitão on 04/08/20.
//  Copyright © 2020 Gustavo. All rights reserved.
//

import UIKit

class HomeCoordinator: CoordinatorProtocol {

    private var navigation: UINavigationController?
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
    
    func start() {
        let viewController = HomeViewController()
        self.navigation?.setViewControllers([viewController], animated: true)
    }
}
