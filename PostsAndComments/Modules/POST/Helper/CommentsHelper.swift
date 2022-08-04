//
//  CommentViewModel.swift
//  PostsAndComments
//
//  Created by AftabAhmed on 02/08/22.
//

import Foundation

/// CommentsHelper helps in fetching the comments over the network.
class CommentsHelper: APIRequestProtocol {
    var endPoint: EndPoint = .comments
    
    var comments: [Comment] = []
    
    func fetchComments() async throws {
        self.comments = try await fetch()
    }
}
