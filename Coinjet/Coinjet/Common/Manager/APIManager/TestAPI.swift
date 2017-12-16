//
//  TestAPI.swift
//  Coinjet
//
//  Created by 강경완 on 2017. 11. 5..
//  Copyright © 2017년 Univreview. All rights reserved.
//

import Foundation

enum TestAPI: API {

    case test(params: [String: String])

    var method: HTTPMethod {
        switch self {
        case .test:
            return .get
        }
    }

    var path: String {
        return "/login"
    }

    var parameters: [String : Any] {
        switch self {
        case .test(let params):
            return params
        }
    }

    var headers: [String : String] {
        return defaultHeaders
    }

}
