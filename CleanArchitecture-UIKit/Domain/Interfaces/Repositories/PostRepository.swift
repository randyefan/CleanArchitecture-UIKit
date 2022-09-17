//
//  PostRepository.swift
//  CleanArchitecture-UIKit
//
//  Created by Randy Efan Jayaputra on 17/09/22.
//

import Foundation

protocol PostRepository {
    typealias PostResult = (Result<[Post], Error>) -> Void
    
    func fetchPosts(completion: @escaping (PostResult))
    func fetchPost(id: Int, completion: @escaping (PostResult))
}
