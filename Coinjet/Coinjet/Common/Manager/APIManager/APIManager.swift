//
//  APIManager.swift
//  Coinjet
//
//  Created by 강경완 on 2017. 11. 5..
//  Copyright © 2017년 Univreview. All rights reserved.
//

import Foundation
import SwiftyJSON

class APIManager {
    
    enum response {
        case success(jsonResponse: JSON)
        case failure(error: AlamofireAPIRequest.APIError)
    }
    
    static func request(apiRequest: API, responseHandler: @escaping (response) -> ()) {
        AlamofireAPIRequest.request(apiRequest: apiRequest, successHandler: { result in
            
            responseHandler(response.success(jsonResponse: result))
        }, failureHandler: { error in
            responseHandler(response.failure(error: error))
        })
    }
}

