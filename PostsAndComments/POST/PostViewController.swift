//
//  ViewController.swift
//  PostsAndComments
//
//  Created by AftabAhmed on 29/07/22.
//

import UIKit

class PostViewController: BaseViewController {

    let viewModel: PostViewControllerViewModel = PostViewControllerViewModel()
    
    var searchController: UISearchController?
    
    @IBOutlet weak var postTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewSetup()
        loadData()
    }
    
    func viewSetup() {
        self.title = "Posts"
        
        postTableView.register(UINib(nibName: PostTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: PostTableViewCell.identifier)
        let postSearchResultViewController = PostSearchResultViewController.instantiate()
        postSearchResultViewController.appCoordinator = self.appCoordinator
        searchController = UISearchController(searchResultsController: postSearchResultViewController)
        searchController?.searchResultsUpdater = self
        self.navigationItem.searchController = searchController
        
    }

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

extension PostViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.postViewModel.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier) as? PostTableViewCell else {
            return UITableViewCell()
        }
        cell.textLabel?.text = viewModel.postViewModel.posts[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let comments = viewModel.commentsFor(viewModel.postViewModel.posts[indexPath.row].id)
        appCoordinator?.showComments(comments)
    }
}

extension PostViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text,
              let resultsController = searchController.searchResultsController as? PostSearchResultViewController
        else {
            return
        }
        
        let results = viewModel.searchPostsFor(text)
        
        let postSearchResultViewModel = PostSearchResultViewModel(results, viewModel.commentViewModel.comments)
        resultsController.viewModel = postSearchResultViewModel
        resultsController.postSearchResultTableView.reloadData()
    }
}

