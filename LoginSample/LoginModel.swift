//
//  LoginModel.swift
//  LoginSample
//
//  Created by Sanjay Raskar on 8/15/18.
//  Copyright © 2018 Sanjay Raskar. All rights reserved.
//

import Foundation
class LoginModel {
    var emailId:String?
    var password:String?
    
    init(emailText:String?, passwordText:String?) {
        self.emailId = emailText
        self.password = passwordText
    }
}
