//
//  PostSearchResultViewModel.swift
//  PostsAndComments
//
//  Created by AftabAhmed on 03/08/22.
//

import Foundation

/// PostSearchResultViewModel is a viewModel for the PostSearchResultViewController
class PostSearchResultViewModel {
    
    var posts: [Post]
    var comments: [Comment]
    
    init(_ posts: [Post], _ comments: [Comment]) {
        self.posts = posts
        self.comments = comments
    }
    
    /// commentsFor filters the stored comments for the input PostId
    /// - Parameter postId: Int
    /// - Returns: [Comment]]
    func commentsFor(_ postId: Int) -> [Comment] {
        self.comments.filter{
            $0.postId == postId
        }
    }
}

