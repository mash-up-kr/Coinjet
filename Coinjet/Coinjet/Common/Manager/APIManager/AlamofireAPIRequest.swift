//
//  AlamofireAPIManager.swift
//  Coinjet
//
//  Created by 강경완 on 2017. 11. 5..
//  Copyright © 2017년 Univreview. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AlamofireAPIRequest {


    enum APIError: Error {
        case parsing
        case server(code :Int, message :String)
        case unknown
    }

    fileprivate static var sessionManager: Alamofire.SessionManager {
        let sessionManager = Alamofire.SessionManager.default
        return sessionManager
    }

    static func request(apiRequest: API, successHandler:  @escaping (JSON) -> (Void), failureHandler: @escaping (APIError) -> (Void)) {

        guard let _ = URL(string: "\(apiRequest.host)\(apiRequest.path)") else {
            failureHandler(APIError.unknown)
            return
        }

        let encoding : ParameterEncoding = apiRequest.method.rawValue != "GET" ? JSONEncoding.default : URLEncoding.default

        sessionManager.request("\(apiRequest.host)\(apiRequest.path)",
            method: apiRequest.method.toAlamofire(),
            parameters: apiRequest.parameters,
            encoding: encoding,
            headers: apiRequest.headers
            ).responseJSON { (response) in
                print(response)
                guard let stateCode = response.response?.statusCode else {
                    failureHandler(APIError.unknown)
                    return
                }



                switch response.result {
                case .success(let value):

                    if stateCode != 200 {
                        failureHandler(APIError.server(code: stateCode, message: "\(stateCode)"))
                    }

                    successHandler(JSON(value))
                case .failure(let err):
                    print(err)
                    failureHandler(APIError.unknown)
                }

        }
    }
}
