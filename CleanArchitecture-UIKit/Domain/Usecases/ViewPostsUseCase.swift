//
//  ViewPostsUseCase.swift
//  CleanArchitecture-UIKit
//
//  Created by Randy Efan Jayaputra on 17/09/22.
//

import Foundation

protocol ViewPostsUseCase {
    func execute(completion: @escaping PostsResult)
}

final class ViewPostsUseCaseImpl: ViewPostsUseCase {
    private let repository: PostRepository
    
    init(repository: PostRepository) {
        self.repository = repository
    }
    
    func execute(completion: @escaping PostsResult) {
        repository.fetchPosts { result in
            switch result {
            case .success(let posts):
                completion(.success(posts))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
