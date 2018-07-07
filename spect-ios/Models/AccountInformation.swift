//
//  AccountInformation.swift
//  spect-ios
//
//  Created by Yassin Mziya on 7/7/18.
//  Copyright © 2018 Yassin Mziya. All rights reserved.
//

import Foundation

class AccountInformation {
    var firstName: String?
    var lastName: String?
    var password: String?
    
    func setName(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func setPassword(password: String) {
        self.password = password
    }
    
}
