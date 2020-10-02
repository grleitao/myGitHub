//
//  AppStyle.swift
//  myGitHubApp
//
//  Created by Gustavo Rodrigues Leitão on 05/08/20.
//  Copyright © 2020 Gustavo. All rights reserved.
//

import Foundation
import SVProgressHUD
import JGProgressHUD

class AppLoading : NSObject {

    class func show() {
        SVProgressHUD.setBackgroundColor(.white)
        SVProgressHUD.setForegroundColor(.black)
        SVProgressHUD.show()
    }
    
    class func stop() {
        SVProgressHUD.dismiss()
    }
}
