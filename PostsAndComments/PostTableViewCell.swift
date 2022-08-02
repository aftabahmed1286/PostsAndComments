//
//  PostTableViewCell.swift
//  PostsAndComments
//
//  Created by AftabAhmed on 02/08/22.
//

import Foundation
import UIKit

class PostTableViewCell: UITableViewCell {
    
    static var identifier: String {
        //PostTableViewCell.Type
        return String(describing: type(of: self)).components(separatedBy: ".")[0]
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
}
