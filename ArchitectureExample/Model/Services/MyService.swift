//
//  MyService.swift
//  ArchitectureExample
//
//  Created by Vincent Grossier on 14/07/2023.
//

import Foundation

protocol MyServiceProtocol {
    func getMyData(completion: @escaping (Result<MyServiceData, Error>) -> Void)
}

final class MyService: MyServiceProtocol {
    private let client: NetworkClientProtocol
    
    init(client: NetworkClientProtocol = URLSessionClient()) {
        self.client = client
    }
    
    func getMyData(completion: @escaping (Result<MyServiceData, Error>) -> Void) {
        client.getData(from: MyServiceRequest.firstRoute) { result in
            switch result {
            case let .failure(error):
                completion(.failure(error))
            case let .success(data):
                do {
                    let result: MyServiceData = try MyServiceMapper.map(data: data)
                    return completion(.success(result))
                } catch {
                    completion(.failure(error))
                }
            }
        }
    }
}
