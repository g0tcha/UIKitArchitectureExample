//
//  MyServiceMapper.swift
//  ArchitectureExample
//
//  Created by Vincent Grossier on 14/07/2023.
//

import Foundation

final class MyServiceMapper {
    
    static func map<T: Decodable>(data: Data) throws -> T {
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw error
        }
    }
}
