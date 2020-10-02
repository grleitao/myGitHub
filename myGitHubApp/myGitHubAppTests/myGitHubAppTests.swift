//
//  myGitHubAppTests.swift
//  myGitHubAppTests
//
//  Created by Gustavo Rodrigues Leitão on 07/08/20.
//  Copyright © 2020 Gustavo. All rights reserved.
//

import XCTest
import Quick
import Nimble
import Nimble_Snapshots

@testable import myGitHubApp

class myGitHubAppTests: QuickSpec {
    
    override func spec() {
        
        describe("default flow behavior") {
            
            var coordinator: HomeCoordinator!
            var navigationViewController: UINavigationController!
            var window: UIWindow!
            
            var welcomeView: UIView!
            var welcomeCardView: HomeWelcomeCardView!
            
            beforeEach {
                window = UIApplication.shared.windows.first { $0.isKeyWindow }
                window.frame = CGRect(x:0, y:0, width: 320, height: 564)
                window.makeKeyAndVisible()
                               
                navigationViewController = UINavigationController()
                window.rootViewController = navigationViewController
                coordinator = HomeCoordinator(navigation: navigationViewController)
                
                welcomeView = UIView()
                welcomeCardView = HomeWelcomeCardView()
                welcomeCardView.translatesAutoresizingMaskIntoConstraints = false
                welcomeView.addSubview(welcomeCardView)
            }
            
            context("must have a correct layout HomeViewController") {
                it("should show linear layout") {
                    coordinator.start()

                    expect(navigationViewController.topViewController).toEventually(beAKindOf(HomeViewController.self))
                    expect(navigationViewController.topViewController).toEventually(haveValidSnapshot(named: "linear layout"))
                    
                }
                
                it("should show welcome card to the application when starting") {
                    
                    expect(welcomeCardView).to(haveValidSnapshot())

                }
            }
        }
    }
}
