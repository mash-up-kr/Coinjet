//
//  API.swift
//  Coinjet
//
//  Created by 강경완 on 2017. 11. 5..
//  Copyright © 2017년 Univreview. All rights reserved.
//


import Foundation

protocol API {
    var method: HTTPMethod { get }
    var host: String { get }
    var path: String { get }
    var parameters: [String: Any] { get }
    var headers: [String: String] { get }
}

extension API {
    var host: String {
        return "https://idb-back.herokuapp.com"
    }

    var defaultHeaders: [String: String] {
        return [
            "Content-Type" : "application/json"
        ]
    }
}
