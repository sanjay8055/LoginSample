//
//  ViewController.swift
//  LoginSample
//
//  Created by Sanjay Raskar on 8/15/18.
//  Copyright © 2018 Sanjay Raskar. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate,vieModelDelegate {
   
    //Outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    //Variables
    var viewModel:LogInViewModel?
    
    //#Pragma MARK: View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.setLeftPaddingPoints(10)
        passwordTextField.setLeftPaddingPoints(10)
        bindViewToModel()
    }

    func bindViewToModel() {
        let emailModel = EmailViewModel.init(emailFieldValue: emailTextField.text ?? "", errorValue: nil)
        let passwordModel = passwordViewModel.init(passFieldValue: passwordTextField.text ?? "", errorValue: nil)
        let model = LoginModel.init(emailText: emailModel.emailFieldValue, passwordText: passwordModel.passFieldValue)
        viewModel = LogInViewModel.init(model:model, emailModel: emailModel,pwdModel: passwordModel,delegate:self)
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
        //Update model
        bindViewToModel()
        //resign keyboard
        self.emailTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
        //validations
        if (viewModel?.validateLoginAction())! {
            viewModel?.signIn()
        }
        else if viewModel?.emailViewModel.errorValue != nil {
            let alert = AlertView(title: (viewModel?.emailViewModel.title)!, message: viewModel?.emailViewModel.errorValue)
             alert.show()
        } else if viewModel?.pwdViewModel.errorValue != nil {
            let alert = AlertView(title: (viewModel?.pwdViewModel.title)!, message: viewModel?.pwdViewModel.errorValue)
            alert.show()
        }
    }
    
    @IBAction func forgotPasswordButtonAction(_ sender: Any) {
        print("Forgot password button clicked.")
    }
    
    //pragma MARK:View model delegates
    func logInSuccess() {
        print("login successful")
        let alert = AlertView(title: NSLocalizedString("Login_success_message", comment: "") , message: nil)
        alert.show()
    }
    
    func logInFailed() {
        print("login failed")
        let alert = AlertView(title: NSLocalizedString(NSLocalizedString("Login_failed_message", comment: ""), comment: ""), message: nil)
        alert.show()
    }
    
    //pragma MARK: Textfield delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    ///////////////////////////////////////
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

