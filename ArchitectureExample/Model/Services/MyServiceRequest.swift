//
//  MyServiceRequest.swift
//  ArchitectureExample
//
//  Created by Vincent Grossier on 14/07/2023.
//

import Foundation

enum MyServiceRequest: RequestProtocol {
    
    case firstRoute
    case secondRoute
    
    var host: String {
        "hostexample.com"
    }
    
    var path: String {
        switch self {
        case .firstRoute:
            return "/firstpath"
        case .secondRoute:
            return "/secondpath"
        }
    }
    
    var urlParams: [String : String] {
        [
            "param1": "value1",
            "param2": "value2"
        ]
    }
    
    var method: String {
        switch self {
        case .firstRoute:
            return "GET"
        case .secondRoute:
            return "POST"
        }
    }
}
