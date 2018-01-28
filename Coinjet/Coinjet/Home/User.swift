//
//  User.swift
//  Coinjet
//
//  Created by Lucas on 2018. 1. 28..
//  Copyright © 2018년 Daeyun Ethan Kim. All rights reserved.
//

import Foundation

class User {
    var auth: Auth?
    var id = 0
    var client = ""
    var uid = ""
    var accessToken = ""
    
    init(auth: Auth, id: Int, client: String, uid: String, accessToken: String){
        self.auth = auth
        self.id = id
        self.client = client
        self.uid = uid
        self.accessToken = accessToken
    }
    init(){}
}
