//
//  HomePresenter.swift
//  myGitHubApp
//
//  Created by Gustavo Rodrigues Leitão on 05/08/20.
//  Copyright © 2020 Gustavo. All rights reserved.
//

import Foundation

class HomePresenter {
    
    var response : [Repositories] = []
    var page: Int = 1

    func getRespositories(completion: @escaping SuccessHandler, failure: @escaping FailureHandler) {
        let requestable = RepositoriesRequestable(page: self.page)
        let service : HTTPRequest<ResponseRepositories> = HTTPRequest(requestable: requestable)
        service.get(success: { result in
            guard let repositories = result else {
                return
            }
            self.page += 1
            self.response += repositories.items
            completion()
        }) { (error) in
            failure(error)
        }
    }
}
