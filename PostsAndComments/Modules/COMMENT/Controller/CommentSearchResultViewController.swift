//
//  CommentSearchResultViewController.swift
//  PostsAndComments
//
//  Created by AftabAhmed on 03/08/22.
//

import UIKit

/// CommentSearchResultViewController is search results controller for CommentViewController
class CommentSearchResultViewController: BaseViewController {
    
    var viewModel: CommentSearchResultViewModel?
    
    @IBOutlet weak var commentSearchResultTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewSetup()
    }
    
    func viewSetup() {
        commentSearchResultTableView.register(UINib(nibName: CommentTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: CommentTableViewCell.identifier)
    }
}

//MARK: - Table delegate and datasource
extension CommentSearchResultViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.comments.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CommentTableViewCell.identifier) as? CommentTableViewCell else {
            return UITableViewCell()
        }
        cell.textLabel?.text = viewModel?.comments[indexPath.row].body
        return cell
    }
}
