//
//  HTTPRequest.swift
//  myGitHubApp
//
//  Created by Gustavo Rodrigues Leitão on 05/08/20.
//  Copyright © 2020 Gustavo. All rights reserved.
//

import UIKit

class HTTPRequest<T : Codable> : NSObject, URLSessionDelegate {
    
    typealias HTTPNewtorkingSuccess  = (T?)-> Swift.Void
    typealias HTTPNewtorkingFailure  = (NSError?)-> Swift.Void
    typealias HTTPNetworkingDataTask = (Data?, URLResponse?, Error?)-> Swift.Void
    
    private(set) var requestable : HTTPRequestable
    private lazy var session     : URLSession = URLSession.shared
    
    init(requestable : HTTPRequestable) {
        self.requestable = requestable
        super.init()
    }
    
    func get(success : @escaping HTTPNewtorkingSuccess, failure : @escaping HTTPNewtorkingFailure) {
        var request = URLRequest(url: requestable.url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = requestable.headers
        request.timeoutInterval     = 15.0
        
        let datatask = session.dataTask(with: request) { data, response, error in
            self.responseHandler(success: success, failure: failure)(data, response, error)
        }
        datatask.resume()
    }
    
    func post(success : @escaping HTTPNewtorkingSuccess, failure : @escaping HTTPNewtorkingFailure, responseQueue : DispatchQueue = .main) {
        var request = URLRequest(url: requestable.url)
        request.httpMethod  = "POST"
        request.httpBody    = try? JSONSerialization.data(withJSONObject: requestable.params, options: .prettyPrinted)
        request.allHTTPHeaderFields = requestable.headers
        request.timeoutInterval     = 15.0
        
        let datatask = self.session.dataTask(with: request) { (data, response, error) in
            self.responseHandler(success: success, failure: failure)(data, response, error)
        }
        datatask.resume()
    }
    
    private func responseHandler(success : @escaping HTTPNewtorkingSuccess, failure : @escaping HTTPNewtorkingFailure)-> HTTPNetworkingDataTask {
        return { data, response, error in
            DispatchQueue.main.async {
                if error != nil {
                    failure(error! as NSError)
                    return
                }
                do {
                    let decoder = JSONDecoder()
                    let json = try data.map {
                        return try decoder.decode(T.self, from: $0)
                    }
                    success(json)
                }catch let error {
                    print(error)
                    failure(error as NSError)
                }
            }
        }
    }
}
