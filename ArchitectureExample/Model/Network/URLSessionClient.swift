//
//  NetworkClient.swift
//  ArchitectureExample
//
//  Created by Vincent Grossier on 14/07/2023.
//

import Foundation

enum NetworkError: Error {
    case serverError
    case requestError
}

protocol NetworkClientProtocol {
    func getData(from request: RequestProtocol, completion: @escaping (Result<Data, Error>) -> Void)
}

final class URLSessionClient: NetworkClientProtocol {
    
    private let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func getData(from request: RequestProtocol, completion: @escaping (Result<Data, Error>) -> Void) {
        do {
            session.dataTask(with: try request.asURLRequest()) { data, response, error in
                guard
                    let data,
                    let response = response as? HTTPURLResponse,
                    response.statusCode == 200
                else {
                    return completion(.failure(NetworkError.serverError))
                }
                
                completion(.success(data))
            }
        } catch {
            completion(.failure(error))
        }
    }
}
