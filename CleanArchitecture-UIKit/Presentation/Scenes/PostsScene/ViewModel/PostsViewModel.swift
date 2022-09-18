//
//  PostsViewModel.swift
//  CleanArchitecture-UIKit
//
//  Created by Randy Efan Jayaputra on 18/09/22.
//

import Foundation

// MARK: - Enum View Model
enum PostsViewModelLoading {
    case none
    case fullScreen
}

enum PostsViewModelRoute {
    case initial
    case showPostDetail(postId: Int)
}

enum PostsViewModelError {
    case none
    case error(String)
}

// MARK: - Protocol
protocol PostsViewModelOutput {
    var items: Observable<[Post]> { get }
    var error: Observable<PostsViewModelError> { get }
    var loadingType: Observable<PostsViewModelLoading> { get }
    var route: Observable<PostsViewModelRoute> { get }
}

protocol PostsViewModelInput {
    func viewDidLoad()
}

protocol PostsViewModel: PostsViewModelInput, PostsViewModelOutput {}

// MARK: - Class
class DefaultPostsViewModel: PostsViewModel {
    var items: Observable<[Post]> = Observable([Post]())
    var error: Observable<PostsViewModelError> = Observable(.none)
    var loadingType: Observable<PostsViewModelLoading> = Observable(.none)
    var route: Observable<PostsViewModelRoute> = Observable(.initial)
    
    private var useCase: ViewPostsUseCase

    init(useCase: ViewPostsUseCase) {
        self.useCase = useCase
    }
    
    func viewDidLoad() {
        loadPosts()
    }
    
    private func loadPosts() {
        loadingType.value = .fullScreen
        error.value = .none
        
        useCase.execute { result in
            switch result {
            case .success(let posts):
                self.items.value = posts
            case .failure(let error):
                self.error.value = .error(error.localizedDescription)
            }
            
            self.loadingType.value = .none
        }
    }
}
