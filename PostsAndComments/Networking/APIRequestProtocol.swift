//
//  APIRequestProtocol.swift
//  PostsAndComments
//
//  Created by AftabAhmed on 02/08/22.
//

import Foundation

/// APIRequestProtocol is the protocol written for Network Requests
protocol APIRequestProtocol {
    
    var endPoint: EndPoint { get }
    
    var baseUrlString: String { get }
    var url: URL? { get }
    
}

extension APIRequestProtocol {
    /// baseUrlString returns baseUrl from the NetworkConstants
    var baseUrlString: String {
        NetworkConstants.baseUrl.rawValue
    }
    
    /// url returns a URL out fo the concatenation of the baseUrlString and the endPoint
    var url: URL? {
        URL(string: baseUrlString + endPoint.rawValue)
    }
    
    /// fetch is a generic method that makes Network Request using URLSession, decodes the response to respective [T] where T confroms to Codable
    /// - Returns: [T]]
    func fetch<T>() async throws -> [T] where T: Codable{
        guard let url = url else {
            //Error 1 - Throw incorrect URL error
            return []
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([T].self, from: data)
    }
}
