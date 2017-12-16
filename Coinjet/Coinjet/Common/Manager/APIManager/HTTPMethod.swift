//
//  HTTPMethod.swift
//  Coinjet
//
//  Created by 강경완 on 2017. 11. 5..
//  Copyright © 2017년 Univreview. All rights reserved.
//

import Foundation
import Alamofire

enum HTTPMethod: String {
    case get = "GET"
    case put = "PUT"
    case post = "POST"
    case delete = "DELETE"
}

extension HTTPMethod {
    func toAlamofire() -> Alamofire.HTTPMethod {
        return Alamofire.HTTPMethod(rawValue: self.rawValue.uppercased()) ?? .post
    }
}
