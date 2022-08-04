//
//  ViewController.swift
//  PostsAndComments
//
//  Created by AftabAhmed on 29/07/22.
//

import UIKit

/// PostViewController is the entry point for the POST Module
class PostViewController: BaseViewController {

    /// Properties
    let viewModel: PostViewModel = PostViewModel()
    var searchController: UISearchController?
    
    /// IBOUtlet
    @IBOutlet weak var postTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewSetup()
        loadData()
    }
    
    /// viewSetup is reponsible for the initial view setup
    func viewSetup() {
        self.title = "Posts"
        
        registerNib()
        searchSetup()
    }
    
    /// registerNib s responsible for all nib registrations
    func registerNib() {
        postTableView.register(UINib(nibName: PostTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: PostTableViewCell.identifier)
    }
    
    /// searchSetup is responsible for the search controller setup
    func searchSetup() {
        let postSearchResultViewController = PostSearchResultViewController.instantiate()
        postSearchResultViewController.appCoordinator = self.appCoordinator
        searchController = UISearchController(searchResultsController: postSearchResultViewController)
        searchController?.searchResultsUpdater = self
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    /// loadData is responsible for loading posts in the table
    func loadData() {
        Task{
            do {
                try await viewModel.loadPostsAndComments()
                self.postTableView.reloadData()
            } catch (let err){
                print(err.localizedDescription)
            }
        }
    }
    
}

//MARK: - Table delegate and datasource
extension PostViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.postHelper.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier) as? PostTableViewCell else {
            return UITableViewCell()
        }
        cell.textLabel?.text = viewModel.postHelper.posts[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let comments = viewModel.commentsFor(viewModel.postHelper.posts[indexPath.row].id)
        appCoordinator?.showComments(comments)
    }
}

//MARK: - SearchController delegate
extension PostViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text,
              let resultsController = searchController.searchResultsController as? PostSearchResultViewController
        else {
            return
        }
        
        let results = viewModel.searchPostsFor(text)
        
        let postSearchResultViewModel = PostSearchResultViewModel(results, viewModel.commentHelper.comments)
        resultsController.viewModel = postSearchResultViewModel
        resultsController.postSearchResultTableView.reloadData()
    }
}

