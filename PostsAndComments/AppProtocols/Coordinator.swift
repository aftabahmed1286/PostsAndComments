//
//  Coordinator.swift
//  PostsAndComments
//
//  Created by AftabAhmed on 02/08/22.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] {get set}
    var navigationController: UINavigationController {get set}
    
    func start()
}
