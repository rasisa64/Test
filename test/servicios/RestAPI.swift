//
//  RestAPI.swift
//  test
//
//  Created by Randy on 2/3/20.
//  Copyright © 2020 test. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

enum ApiResponse<T> {
    case success(T)
    case failure(Error)
}

// PROTOCOL PROGRAMING
protocol RestAPI {

    func callService(withURL urlString:String,
                     verb:HTTPMethod,
                     headers:[String:String]?,
                     body:[String:Any]?,
                     completion:@escaping (ApiResponse<JSON>) -> Void)
    
}

extension RestAPI {
    
    func callService(withURL urlString:String,
                     verb:HTTPMethod,
                     headers:[String:String]? = nil,
                     body:[String:Any]? = nil,
                     completion:@escaping (ApiResponse<JSON>) -> Void) {
 
        let afRequest = Alamofire.request(urlString,method: verb,
                                          parameters: body,encoding: URLEncoding.default,
                                          headers: headers)
        afRequest.validate().responseJSON { (response) in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                completion(.success(json))
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
    }
}

