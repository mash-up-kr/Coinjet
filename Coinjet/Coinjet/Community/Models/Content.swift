//
//  Content.swift
//  Coinjet
//
//  Created by Daeyun Ethan Kim on 23/12/2017.
//  Copyright © 2017 Daeyun Ethan Kim. All rights reserved.
//

import Foundation

struct Content {
    let contentID: String
    let subject: String
    let content: String
    let createDate: String
    let viewCount: Int = 0
    
    let commentCount: Int = 0
    var comments: [Comment]?
    let userName: String
    
}
