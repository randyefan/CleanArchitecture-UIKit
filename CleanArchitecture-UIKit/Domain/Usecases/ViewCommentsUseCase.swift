//
//  ViewCommentsUseCase.swift
//  CleanArchitecture-UIKit
//
//  Created by Randy Efan Jayaputra on 17/09/22.
//

import Foundation

/// Error State
enum LoadCommentsError: Error, Equatable {
    case invalidPostId
    case invalidURL
    case unknown(message: String)
}

protocol ViewCommentsUseCase {
    func execute(postId: Int, completion: @escaping CommentResult)
}

final class ViewCommentsUseCaseImpl: ViewCommentsUseCase {
    private var repository: CommentRepository
    
    init(repository: CommentRepository) {
        self.repository = repository
    }
    
    func execute(postId: Int, completion: @escaping CommentResult) {
        repository.fetchComments(postId: postId) { result in
            switch result {
            case . success(let comments):
                completion(.success(comments))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
