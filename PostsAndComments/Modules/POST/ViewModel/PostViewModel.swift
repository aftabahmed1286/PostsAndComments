//
//  PostViewControllerViewModel.swift
//  PostsAndComments
//
//  Created by AftabAhmed on 03/08/22.
//

import Foundation

/// PostViewModel is a viewModel for the PostViewController
class PostViewModel {
    let postHelper = PostsHelper()
    let commentHelper = CommentsHelper()
    
    /// loadPostsAndComments is an async throwable method that fetches and updates the variables for posts and cmments
    func loadPostsAndComments() async throws {
        try await postHelper.fetchPosts()
        try await commentHelper.fetchComments()
    }
    
    /// searchPostsFor searches and returns the posts from the PostHelper's searchPostsFor method
    /// - Parameter searchText: String
    /// - Returns: [Post]
    func searchPostsFor(_ searchText: String) -> [Post] {
        postHelper.searchPostsFor(searchText)
    }
    
    /// commentsFor filters the stored comments for the input PostId
    /// - Parameter postId: Int
    /// - Returns: [Comment]]
    func commentsFor(_ postId: Int) -> [Comment]{
        commentHelper.comments.filter{
            $0.postId == postId
        }
    }
}
