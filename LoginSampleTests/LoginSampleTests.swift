//
//  LoginSampleTests.swift
//  LoginSampleTests
//
//  Created by Sanjay Raskar on 8/15/18.
//  Copyright © 2018 Sanjay Raskar. All rights reserved.
//

import XCTest
@testable import LoginSample

class LoginSampleTests: XCTestCase {
    var viewModel:LogInViewModel?
    override func setUp() {
        super.setUp()
        let emailModel = EmailViewModel.init(emailFieldValue: "Test@gmail.com", errorValue: nil)
        let passwordModel = passwordViewModel.init(passFieldValue: "12345678", errorValue: nil)
        let model = LoginModel.init(emailText: emailModel.emailFieldValue, passwordText: passwordModel.passFieldValue)
        viewModel = LogInViewModel.init(model: model, emailModel: emailModel, pwdModel: passwordModel, delegate: nil)
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testLoginValidations() {
        XCTAssertTrue((viewModel?.pwdViewModel.passFieldValue.count)! >= 8)
        XCTAssertTrue((viewModel?.emailViewModel.validate())!)
        XCTAssertEqual(viewModel?.emailViewModel.emailFieldValue, "Test@gmail.com")
    }
    

    
}
