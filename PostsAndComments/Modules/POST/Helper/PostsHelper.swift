//
//  PostViewModel.swift
//  PostsAndComments
//
//  Created by AftabAhmed on 02/08/22.
//

import Foundation

/// PostsHelper helps in fetching the posts over the network.
class PostsHelper: APIRequestProtocol {
    var endPoint: EndPoint = .posts
    
    var posts: [Post] = []
    
    func fetchPosts() async throws {
        self.posts = try await fetch()
    }
}

