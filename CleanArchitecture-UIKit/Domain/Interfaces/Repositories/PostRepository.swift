//
//  PostRepository.swift
//  CleanArchitecture-UIKit
//
//  Created by Randy Efan Jayaputra on 17/09/22.
//

import Foundation

typealias PostsResult = (Result<[Post], Error>) -> Void
typealias PostResult = (Result<Post, Error>) -> Void

protocol PostRepository {
    func fetchPosts(completion: @escaping (PostsResult))
    func fetchPost(id: Int, completion: @escaping (PostResult))
}
