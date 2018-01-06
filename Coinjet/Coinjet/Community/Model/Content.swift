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

struct User {   // 기기에 저장
    var seller: String
    var coin: String
}

/*
 // 게시판 테이블
 Content {
    contentID: VARCHAR //  PRI
    subject: VARCHAR
    content: TEXT
    createDate: DATETIME
    viewCount: INT
    commentCount: INT // 굳이 필요 없어 보임..
 
    userID: VARCHAR // FOR
 }
 
 // 답글 테이블
 Comment {
    commentID: VARCHAR  // PRI
    comment: VARCHAR
    createDate: DATETIME
 
    userID: VARCHAR // FOR
    contentID: VARCHAR // FOR
 }
 */
