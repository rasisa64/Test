//
//  Constants.swift
//  test
//
//  Created by Randy on 2/3/20.
//  Copyright © 2020 test. All rights reserved.
//

import Foundation

enum Constants {
  
    enum Network {
        
        fileprivate static let urlInfoKey = "APP-URL"
        static var baseURL:String {
            guard let value = Bundle.main.object(forInfoDictionaryKey: urlInfoKey) as? String else {
                return ""
            }
            return value
        }

    
    }
}

