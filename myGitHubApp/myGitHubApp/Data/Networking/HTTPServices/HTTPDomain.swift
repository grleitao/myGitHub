//
//  HTTPDomain.swift
//  myGitHubApp
//
//  Created by Gustavo Rodrigues Leitão on 05/08/20.
//  Copyright © 2020 Gustavo. All rights reserved.
//

import Foundation

protocol HTTPDomain {
    
    var environment : HTTPEnvironment { get }
}

extension HTTPDomain {
    
    var environment : HTTPEnvironment {
        return .prod
    }
}
