//
//  ViewPostUseCase.swift
//  CleanArchitecture-UIKit
//
//  Created by Randy Efan Jayaputra on 17/09/22.
//

import Foundation

protocol ViewPostUseCase {
    func execute(id: Int, completion: @escaping PostResult)
}

final class ViewPostUseCaseImpl: ViewPostUseCase {
    private let repository: PostRepository
    
    init(repository: PostRepository) {
        self.repository = repository
    }
    
    func execute(id: Int, completion: @escaping PostResult) {
        repository.fetchPost(id: id) { result in
            switch result {
            case .success(let post):
                completion(.success(post))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
