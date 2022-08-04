//
//  CommentViewControllerViewModel.swift
//  PostsAndComments
//
//  Created by AftabAhmed on 03/08/22.
//

import Foundation

/// CommentViewModel is a viewModel for the CommentViewController
class CommentViewModel {
    
    var comments: [Comment] = []
    
    /// searchCommentsFor returns comments having the input searchText
    /// - Parameter searchText: String
    /// - Returns: [Comment]
    func searchCommentsFor(_ searchText: String) -> [Comment] {
        comments.filter{
            $0.body.lowercased().contains(searchText.lowercased()) || $0.id == Int(searchText)
        }
    }
}
