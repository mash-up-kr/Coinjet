//
//  Auth.swift
//  Coinjet
//
//  Created by Lucas on 2018. 1. 28..
//  Copyright © 2018년 Daeyun Ethan Kim. All rights reserved.
//

import Foundation

class Auth {
    
    var accessToken: String = ""
    var email: String = ""
    var name: String = ""
    
    init(accessToken: String){
        self.accessToken = accessToken
    }
    
}
