//
//  CommentService.swift
//  CleanArchitecture-UIKit
//
//  Created by Randy Efan Jayaputra on 18/09/22.
//

import Foundation

protocol CommentService {
    func fetchComments(postId: Int, completion: @escaping CommentResult)
}

class CommentServiceImpl: CommentService {
    let baseURL = "https://jsonplaceholder.typicode.com"
    
    func makeURLString(postId: Int) -> String {
        return baseURL + "/comments?postId=\(postId)"
    }
    
    func fetchComments(postId: Int, completion: @escaping CommentResult) {
        if postId < 0 {
            completion(.failure(.invalidPostId))
            return
        }
        
        
        let url = URL(string: makeURLString(postId: postId))!
        URLSession.shared.dataTask(with: url) { (data, urlResponse, error) in
            if let error = error {
                completion(.failure(.unknown(message: error.localizedDescription)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.unknown(message: "Data is null from response")))
                return
            }
            
            guard let httpResponse = urlResponse as? HTTPURLResponse else {
                completion(.failure(.unknown(message: "Cannot get HTTPResponse")))
                return
            }
            
            if httpResponse.statusCode == HTTPCode.OK_200 {
                do {
                    let comments = try JSON().newJSONDecoder().decode([CommentResponse].self, from: data)
                    completion(.success(comments))
                } catch (let error) {
                    completion(.failure(.unknown(message: error.localizedDescription)))
                }
            }
        }.resume()
    }
    
    
}
