//
//  HTTPEnvironment.swift
//  myGitHubApp
//
//  Created by Gustavo Rodrigues Leitão on 05/08/20.
//  Copyright © 2020 Gustavo. All rights reserved.
//

import Foundation

enum HTTPEnvironment {
    case prod
    case hom
    case dev
    
    var host : String {
        switch self {
        case .prod:
            return "https://api.github.com"
        case .hom:
            return ""
        case .dev:
            return ""
        }
    }
}
