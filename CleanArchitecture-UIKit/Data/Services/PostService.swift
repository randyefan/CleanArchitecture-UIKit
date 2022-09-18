//
//  PostService.swift
//  CleanArchitecture-UIKit
//
//  Created by Randy Efan Jayaputra on 18/09/22.
//

import Foundation

protocol PostService {
    func fetchPosts(completion: @escaping PostsResult)
    func fetchPosts(id: Int, completion: @escaping PostResult)
}

class PostServiceImpl: PostService {
    let baseURL = "https://jsonplaceholder.typicode.com/posts"
    
    private func makeURLString(id: Int? = nil) -> String {
        if let id = id {
            return baseURL + "/\(id)"
        } else {
            return baseURL
        }
    }
    
    func fetchPosts(completion: @escaping PostsResult) {
        let url = URL(string: makeURLString())!
        URLSession.shared.dataTask(with: url) { (data, urlResponse, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else { return }
            
            do {
                let posts = try JSON().newJSONDecoder().decode([Post].self, from: data)
                completion(.success(posts))
            } catch(let error) {
                completion(.failure(error))
            }
        }.resume()
    }
    
    func fetchPosts(id: Int, completion: @escaping PostResult) {
        let url = URL(string: makeURLString(id: id))!
        
        URLSession.shared.dataTask(with: url) { (data, urlResponse, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else { return }
            
            do {
                let post = try JSON().newJSONDecoder().decode(Post.self, from: data)
                completion(.success(post))
            } catch(let error) {
                completion(.failure(error))
            }
        }.resume()
    }
}
