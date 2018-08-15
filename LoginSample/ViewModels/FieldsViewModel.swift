//
//  FieldsViewModel.swift
//  LoginSample
//
//  Created by Sanjay Raskar on 8/15/18.
//  Copyright © 2018 Sanjay Raskar. All rights reserved.
//

import Foundation
protocol LIFieldViewModel {
    var title:String{get}
    var message:String{get}

    mutating func validate() -> Bool
}

extension LIFieldViewModel {
    func validateSize(_ value: String, length:(start:Int, end:Int)) -> Bool  {
        return (length.start...length.end).contains(value.count)
    }
    
    func validateString(_ value:String, pattern:String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", pattern)
        return predicate.evaluate(with: value)
    }
}
