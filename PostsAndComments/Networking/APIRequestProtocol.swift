//
//  APIRequestProtocol.swift
//  PostsAndComments
//
//  Created by AftabAhmed on 02/08/22.
//

import Foundation

protocol APIRequestProtocol {
    var endPoint: EndPoint { get }
    
    var baseUrlString: String { get }
    var url: URL? { get }
    
}

extension APIRequestProtocol {
    var baseUrlString: String {
        NetworkConstants.baseUrl.rawValue
    }
    
    var url: URL? {
        URL(string: baseUrlString + endPoint.rawValue)
    }
    
    func fetch<T>() async throws -> [T] where T: Codable{
        guard let url = url else {
            //Error 1 - Throw incorrect URL error
            return []
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([T].self, from: data)
    }
}
