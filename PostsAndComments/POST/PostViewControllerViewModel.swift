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
    
    func searchPostsFor(_ searchText: String, _ resultsController: PostSearchResultViewController) {
        let posts = postViewModel.searchPostsFor(searchText)
        
        let postSearchResultViewModel = PostSearchResultViewModel(posts)
        resultsController.viewModel = postSearchResultViewModel
        resultsController.postSearchResultTableView.reloadData()
    }
}
