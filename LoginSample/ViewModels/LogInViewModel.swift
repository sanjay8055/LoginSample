                            //
//  signInViewModel.swift
//  LoginSample
//
//  Created by Sanjay Raskar on 8/15/18.
//  Copyright © 2018 Sanjay Raskar. All rights reserved.
//

import Foundation
protocol vieModelDelegate:class {
    func logInSuccess()
    func logInFailed()
}
                            
 struct LogInViewModel {
    let model: LoginModel
    var emailViewModel:EmailViewModel
    var pwdViewModel:passwordViewModel
    weak var delegate:vieModelDelegate?
    
    init (model:LoginModel,emailModel:EmailViewModel,pwdModel:passwordViewModel,delegate:vieModelDelegate?) {
        self.model = model
        self.emailViewModel = emailModel
        self.pwdViewModel = pwdModel
        self.delegate = delegate
    }
    
    mutating func validateLoginAction() -> Bool {
        return (emailViewModel.validate() && pwdViewModel.validate())
    }
    func signIn() {
        if model.emailId == "test@test.com" && model.password == NSLocalizedString("password_label", comment: "")  {
            self.delegate?.logInSuccess()
        } else {
            self.delegate?.logInFailed()
        }
    }
 }
