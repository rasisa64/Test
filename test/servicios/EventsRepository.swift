//
//  EventsRepository.swift
//  test
//
//  Created by Randy on 2/3/20.
//  Copyright © 2020 test. All rights reserved.
//

import SwiftyJSON

struct EventsRepository: RestAPI {
    
    func getAll(completion:@escaping (ApiResponse<JSON>) -> Void) {
        

        let url = "\(Constants.Network.baseURL)api/v1/listar-historias"
        let header = ["Chasqui-Movil":"+61477222637", "Chasqui-Token":"91b9081d0098483ca7abc0f67cf70dd8"]
        let body = ["ps":"15", "p":"1"]
        
        callService(withURL: url, verb: .get, headers: header, body: body) { (response) in
            switch response {
            case .success(let json):
                if let message = json["message"].string {
                    let error = NSError(domain: "AM",
                                        code: -1999,
                                        userInfo: [NSLocalizedDescriptionKey:message])
                    completion(.failure(error))
                    return
                }
                print(json)
                completion(.success(json))
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
