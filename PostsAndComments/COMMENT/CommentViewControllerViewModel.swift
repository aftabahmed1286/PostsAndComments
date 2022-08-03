//
//  CommentViewControllerViewModel.swift
//  PostsAndComments
//
//  Created by AftabAhmed on 03/08/22.
//

import Foundation

class CommentViewControllerViewModel {
    var comments: [Comment] = []
    
    func searchCommentsFor(_ searchText: String) -> [Comment] {
        comments.filter{
            $0.body.lowercased().contains(searchText.lowercased()) || $0.id == Int(searchText)
        }
    }
}
