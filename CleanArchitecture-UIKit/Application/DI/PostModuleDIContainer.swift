//
//  PostModuleDIContainer.swift
//  CleanArchitecture-UIKit
//
//  Created by Randy Efan Jayaputra on 18/09/22.
//

import UIKit

final class PostModuleDIContainer {
    
    struct Dependency {
        let postService: PostService
    }
    
    private let dependency: Dependency
    
    init(dependency: Dependency) {
        self.dependency = dependency
    }
    
    
    // MARK: - Posts
    
    private func makePostsViewController() -> UIViewController {
        let vc = PostsViewController.create(with: makePostsViewModel())
        return vc
    }
    
    private func makePostsUseCase() -> ViewPostsUseCase {
        let useCase: ViewPostsUseCase = ViewPostsUseCaseImpl(repository: makePostsRepository())
        return useCase
    }
    
    private func makePostsRepository() -> PostRepository {
        let repository: PostRepository = PostRepositoryImpl(service: dependency.postService)
        return repository
    }
    
    func makePostsViewModel() -> PostsViewModel {
        let viewModel: PostsViewModel = DefaultPostsViewModel(useCase: makePostsUseCase())
        return viewModel
    }
    
}
