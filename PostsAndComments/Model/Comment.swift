//
//  Comment.swift
//  PostsAndComments
//
//  Created by AftabAhmed on 02/08/22.
//

import Foundation

struct Comment: Codable {
    var id: Int
    var body: String
    var postId: Int
}
