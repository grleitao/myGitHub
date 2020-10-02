//
//  RepositoriesRequestableTests.swift
//  myGitHubAppTests
//
//  Created by Gustavo Rodrigues Leitão on 07/08/20.
//  Copyright © 2020 Gustavo. All rights reserved.
//

import XCTest
import Quick
import Nimble

@testable import myGitHubApp

class RepositoriesRequestableTests: QuickSpec {
    
    private let url  = HTTPEnvironment.self
    private let prod = "https://api.github.com"
    private let hml  = ""
    private let dev  = ""
        
    override func spec() {
        describe("check url") {
            it("checks if production url") {
                expect(self.url.prod.host).notTo(beNil())
                expect(self.url.prod.host).to(equal(self.prod))
            }
            
            it("checks if homolog url") {
                expect(self.url.hom.host).notTo(beNil())
                expect(self.url.hom.host).to(equal(self.hml))
            }
            
            it("checks if dev url") {
                expect(self.url.dev.host).notTo(beNil())
                expect(self.url.dev.host).to(equal(self.dev))
            }
        }
    }
}
