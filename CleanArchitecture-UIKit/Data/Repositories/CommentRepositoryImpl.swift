//
//  CommentRepositoryImpl.swift
//  CleanArchitecture-UIKit
//
//  Created by Randy Efan Jayaputra on 18/09/22.
//

import Foundation

class CommentRepositoryImpl: CommentRepository {
    private var service: CommentService
    
    init(service: CommentService) {
        self.service = service
    }
    
    func fetchComments(postId: Int, completion: @escaping CommentResult) {
        service.fetchComments(postId: postId) { result in
            switch result {
            case .success(let comments):
                completion(.success(comments))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
