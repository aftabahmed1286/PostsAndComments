//
//  PostViewControllerViewModel.swift
//  PostsAndComments
//
//  Created by AftabAhmed on 03/08/22.
//

import Foundation

class PostViewModel {
    let postHelper = PostsHelper()
    let commentHelper = CommentsHelper()
    
    func loadPostsAndComments() async throws {
        try await postHelper.fetchPosts()
        try await commentHelper.fetchComments()
    }
    
    func searchPostsFor(_ searchText: String) -> [Post] {
        postHelper.searchPostsFor(searchText)
    }
    
    func commentsFor(_ postId: Int) -> [Comment]{
        commentHelper.comments.filter{
            $0.postId == postId
        }
    }
}
