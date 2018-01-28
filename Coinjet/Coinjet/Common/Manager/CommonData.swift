//
//  CommonData.swift
//  Coinjet
//
//  Created by Lucas on 2018. 1. 28..
//  Copyright © 2018년 Daeyun Ethan Kim. All rights reserved.
//

import Foundation


class CommonData {
    
    static let shared = CommonData()
    
    private lazy var user: User? = nil
    private let userDefault = UserDefaults.standard
    
    var userData: User? {
        if user == nil {
            user = getUserInfo()
        }
        return self.user
    }
    
    init() {}
    
    func saveUserInfo(user: User){
        self.user = user
        userDefault.set(user.accessToken, forKey: "accessToken")
        userDefault.set(user.uid, forKey: "uid")
        userDefault.set(user.client, forKey: "client")
        userDefault.set(user.auth?.accessToken ?? "", forKey: "oAuthAccessToken")
        
    }
    
    func deleteUserInfo() {
        self.user = User()
        userDefault.set(user?.accessToken, forKey: "accessToken")
        userDefault.set(user?.uid, forKey: "uid")
        userDefault.set(user?.client, forKey: "client")
        userDefault.set(user?.auth?.accessToken ?? "", forKey: "oAuthAccessToken")
    }
    
    func getUserInfo() -> User{
        let oAuthAccessToken = userDefault.string(forKey: "oAuthAccessToken") ?? ""
        let uid = userDefault.string(forKey: "uid") ?? ""
        let client = userDefault.string(forKey: "client") ?? ""
        let accessToken = userDefault.string(forKey: "accessToken") ?? ""
        
        let auth = Auth(accessToken: oAuthAccessToken)
        return User(auth: auth, id: 0, client: client, uid: uid, accessToken: accessToken)
    }
    
    
    
}
