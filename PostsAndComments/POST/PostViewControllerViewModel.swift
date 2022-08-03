//
//  PostViewControllerViewModel.swift
//  PostsAndComments
//
//  Created by AftabAhmed on 03/08/22.
//

import Foundation

class PostViewControllerViewModel {
    let postViewModel = PostViewModel()
    let commentViewModel = CommentViewModel()
    
    func loadPostsAndComments() async throws {
        try await postViewModel.fetchPosts()
        try await commentViewModel.fetchComments()
    }
    
    func searchPostsFor(_ searchText: String) -> [Post] {
        postViewModel.searchPostsFor(searchText)
    }
    
    func commentsFor(_ postId: Int) -> [Comment]{
        commentViewModel.comments.filter{
            $0.postId == postId
        }
    }
}
