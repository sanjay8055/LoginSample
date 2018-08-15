//
//  alertView.swift
//  LoginSample
//
//  Created by Sanjay Raskar on 8/15/18.
//  Copyright © 2018 Sanjay Raskar. All rights reserved.
//

import Foundation
import UIKit
class AlertView {
    let alertTitle:String
    let alertMessage:String?
    init(title:String, message:String?) {
        self.alertTitle = title
        self.alertMessage = message
    }
    func show()  {
        let alertView = UIAlertController.init(title: self.alertTitle, message: alertMessage, preferredStyle: .alert)
        alertView.addAction(UIAlertAction(title: NSLocalizedString("ok_label", comment: "") , style: .cancel, handler: nil))
        UIApplication.shared.keyWindow?.rootViewController?.present(alertView, animated: true, completion: nil)
    }
}
