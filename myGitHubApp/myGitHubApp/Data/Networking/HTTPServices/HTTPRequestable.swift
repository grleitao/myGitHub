//
//  HTTPRequestable.swift
//  myGitHubApp
//
//  Created by Gustavo Rodrigues Leitão on 05/08/20.
//  Copyright © 2020 Gustavo. All rights reserved.
//

import Foundation

protocol HTTPRequestable : HTTPDomain {
        
    var url  : URL { get }
    
    var params : [String : Any] { get }
}

extension HTTPRequestable {
    
    var headers : [String : String] {
        return ["Content-Type" : "text/html", "Accept" : "application/json" ]
    }
}
