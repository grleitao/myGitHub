//
//  RepositoriesRequestable.swift
//  myGitHubApp
//
//  Created by Gustavo Rodrigues Leitão on 05/08/20.
//  Copyright © 2020 Gustavo. All rights reserved.
//

import Foundation

struct RepositoriesRequestable: HTTPRequestable {
    
    var page : Int
    
    var url: URL {
        return URL(string: "\(HTTPEnvironment.prod.host)/search/repositories?q=language:swift&sort=stars&page=\(page)")!
    }
    
    var params: [String : Any] {
        return [:]
    }
}
