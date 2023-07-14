//
//  RequestProtocol.swift
//  ArchitectureExample
//
//  Created by Vincent Grossier on 14/07/2023.
//

import Foundation

protocol RequestProtocol {
    var host: String { get }
    var path: String { get }
    var urlParams: [String: String] { get }
    var method: String { get }
    func asURLRequest() throws -> URLRequest
}

extension RequestProtocol {
    
    func asURLRequest() throws -> URLRequest {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = host
        urlComponents.path = path
        
        if !urlParams.isEmpty {
            urlComponents.queryItems = urlParams.map { URLQueryItem(name: $0, value: $1) }
        }
        
        guard let url = urlComponents.url else {
            throw NetworkError.requestError
        }
        
        return URLRequest(url: url)
    }
}
