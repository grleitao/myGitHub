//
//  Repositories.swift
//  myGitHubApp
//
//  Created by Gustavo Rodrigues Leitão on 05/08/20.
//  Copyright © 2020 Gustavo. All rights reserved.
//

import Foundation

class ResponseRepositories: Codable {
    var items: [Repositories] = []
}

struct Repositories: Codable {
    var name            : String?
    var full_name       : String?
    var stargazers_count: Int?
    var owner           : RepositorieOwner?
}

struct RepositorieOwner: Codable {
    var login      : String?
    var avatar_url : String?
}
