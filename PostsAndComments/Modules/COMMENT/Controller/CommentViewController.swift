//
//  CommentViewController.swift
//  PostsAndComments
//
//  Created by AftabAhmed on 02/08/22.
//

import UIKit

/// CommentViewController is the entry point for the COMMENT Module
class CommentViewController: BaseViewController {

    
    /// Properties
    var viewModel: CommentViewModel?
    var searchController: UISearchController?
    
    /// IBoutlet
    @IBOutlet weak var commentTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewSetup()
        
    }
    
    /// viewSetup is reponsible for the initial view setup
    func viewSetup() {
        self.title = "Comments"
        
        registerNib()
        searchSetup()
    }
    
    /// registerNib s responsible for all nib registrations
    func registerNib() {
        commentTableView.register(UINib(nibName: CommentTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: CommentTableViewCell.identifier)
    }
    
    /// searchSetup is responsible for the search controller setup
    func searchSetup() {
        let commentSearchResultViewController = CommentSearchResultViewController.instantiate()
        searchController = UISearchController(searchResultsController: commentSearchResultViewController)
        searchController?.searchResultsUpdater = self
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
    }
    
}

extension CommentViewController: UITableViewDelegate, UITableViewDataSource {
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

extension CommentViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text,
              let resultsController = searchController.searchResultsController as? CommentSearchResultViewController,
                let viewModel = viewModel
        else {
            return
        }
        
        let results = viewModel.searchCommentsFor(text)
        
        let commentSearchResultViewModel = CommentSearchResultViewModel(results)
        resultsController.viewModel = commentSearchResultViewModel
        resultsController.commentSearchResultTableView.reloadData()
    }
    
    
}
