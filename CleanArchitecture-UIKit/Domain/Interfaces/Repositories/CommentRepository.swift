//
//  CommentRepository.swift
//  CleanArchitecture-UIKit
//
//  Created by Randy Efan Jayaputra on 17/09/22.
//

import Foundation

protocol CommentRepository {
    typealias CommentResult = (Result<[CommentResponse], Error>) -> Void
    
    func fetchComments(postId: Int, completion: @escaping CommentResult)
}
