//
//  EmailandPasswordViewModel.swift
//  LoginSample
//
//  Created by Sanjay Raskar on 8/15/18.
//  Copyright © 2018 Sanjay Raskar. All rights reserved.
//

import Foundation
struct EmailViewModel:LIFieldViewModel {
    let title: String = NSLocalizedString("email_label", comment: "")
    var emailFieldValue:String = ""
    var errorValue:String?
    let message: String = NSLocalizedString("email_validation_message", comment: "")
    
    mutating func validate() -> Bool {
        guard validateString(emailFieldValue, pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}") else {
            errorValue = message
            return false
        }
        errorValue = nil
        return true
    }
}

struct passwordViewModel:LIFieldViewModel {
    let title: String = NSLocalizedString("Password_label", comment: "")
    var passFieldValue:String = ""
    var errorValue:String?
    let message: String = NSLocalizedString("password_validation_message", comment: "")
    
    mutating func validate() -> Bool {
        guard validateSize(passFieldValue, length: (8, end: 20)) else {
            errorValue = message
            return false
        }
        errorValue = nil
        return true
    }
}
