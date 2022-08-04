//
//  PostViewModel.swift
//  PostsAndComments
//
//  Created by AftabAhmed on 02/08/22.
//

import Foundation

class PostsHelper: APIRequestProtocol {
    var endPoint: EndPoint = .posts
    
    var posts: [Post] = []
    
    func fetchPosts() async throws {
        self.posts = try await fetch()
    }
    
    func searchPostsFor(_ searchText: String) -> [Post] {
        posts.filter{
            $0.title.lowercased().contains(searchText.lowercased()) || $0.id == Int(searchText)
        }
    }
}

