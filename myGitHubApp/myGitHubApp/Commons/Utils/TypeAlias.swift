//
//  TypeAlias.swift
//  myGitHubApp
//
//  Created by Gustavo Rodrigues Leitão on 05/08/20.
//  Copyright © 2020 Gustavo. All rights reserved.
//

import Foundation

typealias SuccessHandler  = (()-> Swift.Void)
typealias FailureHandler  = ((NSError?)-> Swift.Void)
