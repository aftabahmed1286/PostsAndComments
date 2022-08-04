//
//  CommentSearchResultViewModel.swift
//  PostsAndComments
//
//  Created by AftabAhmed on 03/08/22.
//

import Foundation

/// CommentSearchResultViewModel is a viewModel for the CommentSearchResultViewController
class CommentSearchResultViewModel {
    
    var comments: [Comment]
    
    init(_ comments: [Comment]) {
        self.comments = comments
    }

}
