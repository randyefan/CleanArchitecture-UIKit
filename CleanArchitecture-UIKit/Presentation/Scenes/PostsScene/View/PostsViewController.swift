//
//  ViewController.swift
//  CleanArchitecture-UIKit
//
//  Created by Randy Efan Jayaputra on 17/09/22.
//

import UIKit

// MARK: - DI Helper
extension PostsViewController {
    final class func create(with viewModel: PostsViewModel) -> PostsViewController {
        let storyboard = UIStoryboard(name: "main", bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(withIdentifier: "PostsViewController") as! PostsViewController
        vc.viewModel = viewModel
        return vc
    }
}

class PostsViewController: UIViewController {

    // MARK: - IBOutlet
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Variable
    
    private var viewModel: PostsViewModel!
    
    // MARK: - UI variable
    
    private let loadingViewController: LoadingViewController = {
        let viewController = LoadingViewController()
        return viewController
    }()
    
    // MARK: - ViewController Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.viewDidLoad()
        
        setupTableView()
        setupObserver()
    }
    
    // MARK: - Private Func
    
    private func setupObserver() {
        viewModel.items.observe(on: self) { posts in
            self.tableView.reloadData()
        }
        
        viewModel.error.observe(on: self) { error in
            switch error {
            case .none: break
            case .error(let message): self.showAlertController(withTitle: "Error", message: message, completion: nil)
            }
        }
        
        viewModel.loadingType.observe(on: self) { loadingType in
            switch loadingType {
            case .fullScreen: self.showLoadingView()
            case .none: self.hideLoadingView()
            }
        }
        
        viewModel.route.observe(on: self) { [weak self] route in
            self?.handle(route)
        }
    }
    
    private func showLoadingView() {
        addChildVC(asChildViewController: loadingViewController, to: view)
    }
    
    private func hideLoadingView() {
        loadingViewController.remove()
    }
    
    private func handle(_ route: PostsViewModelRoute) {
        switch route {
        case .initial: break
        case .showPostDetail(_): break // Handle Later
        }
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "PostsCellId")
    }
    
    // MARK: - Public Func
    
    func inject(with viewModel: PostsViewModel) {
        self.viewModel = viewModel
    }

}

extension PostsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostsCellId", for: indexPath)
        let post = viewModel.items.value[indexPath.row]
        cell.textLabel?.text = post.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
