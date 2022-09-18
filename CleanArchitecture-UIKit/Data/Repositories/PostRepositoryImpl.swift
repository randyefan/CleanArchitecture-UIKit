//
//  PostRepositoryImpl.swift
//  CleanArchitecture-UIKit
//
//  Created by Randy Efan Jayaputra on 18/09/22.
//

import Foundation

class PostRepositoryImpl: PostRepository {
    private var service: PostService
    
    init(service: PostService) {
        self.service = service
    }
    
    func fetchPosts(completion: @escaping (PostsResult)) {
        service.fetchPosts { result in
            switch result {
            case .success(let posts):
                completion(.success(posts))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func fetchPost(id: Int, completion: @escaping (PostResult)) {
        service.fetchPost(id: id) { result in
            switch result {
            case .success(let posts):
                completion(.success(posts))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
