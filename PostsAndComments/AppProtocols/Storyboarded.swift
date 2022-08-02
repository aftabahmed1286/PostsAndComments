//
//  Storyboarded.swift
//  PostsAndComments
//
//  Created by AftabAhmed on 02/08/22.
//

import Foundation
import UIKit
/*
 PLEASE NOTE: -  Name the identifier for the class with the same name as class name.
 */
enum StoryboardName {
    static let main = "Main"
}

protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController{
    
    static func instantiate() -> Self {
        
        let fullFileName = NSStringFromClass(self)//<App>.<ViewController>
        let className = fullFileName.components(separatedBy: ".")[1]//<ViewController>
        
        let storyboard = UIStoryboard(name: StoryboardName.main, bundle: .main)
        
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
    
}
