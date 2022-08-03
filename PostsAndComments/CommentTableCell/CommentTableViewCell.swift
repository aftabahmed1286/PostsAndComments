//
//  CommentTableViewCell.swift
//  PostsAndComments
//
//  Created by AftabAhmed on 03/08/22.
//

import Foundation
import UIKit

class CommentTableViewCell: UITableViewCell {
    
    static var identifier: String {
        //CommentTableViewCell.Type
        return String(describing: type(of: self)).components(separatedBy: ".")[0]
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
}


