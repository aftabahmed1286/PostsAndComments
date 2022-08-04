//
//  PostSearchResultViewController.swift
//  PostsAndComments
//
//  Created by AftabAhmed on 02/08/22.
//

import UIKit

/// PostSearchResultViewController is search results controller for PostViewController
class PostSearchResultViewController: BaseViewController {
    
    /// Properties
    var viewModel: PostSearchResultViewModel?
    
    /// IBOutlet
    @IBOutlet weak var postSearchResultTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewSetup()
    }
    
    /// viewSetup is reponsible for the initial view setup
    func viewSetup() {
        postSearchResultTableView.register(UINib(nibName: PostTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: PostTableViewCell.identifier)
    }
}

//MARK: - Table delegate and datasource
extension PostSearchResultViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.posts.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier) else {
            return UITableViewCell()
        }
        cell.textLabel?.text = viewModel?.posts[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewModel = viewModel else {return}
        let comments = viewModel.commentsFor(viewModel.posts[indexPath.row].id)
        appCoordinator?.showComments(comments)
    }
}
