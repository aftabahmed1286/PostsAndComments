//
//  PostSearchResultViewModel.swift
//  PostsAndComments
//
//  Created by AftabAhmed on 03/08/22.
//

import Foundation

class PostSearchResultViewModel {
    
    var posts: [Post]
    
    init(_ posts: [Post]) {
        self.posts = posts
    }
}
