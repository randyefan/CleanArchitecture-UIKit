//
//  CommentRepository.swift
//  CleanArchitecture-UIKit
//
//  Created by Randy Efan Jayaputra on 17/09/22.
//

import Foundation

typealias CommentResult = (Result<[CommentResponse], LoadCommentsError>) -> Void

protocol CommentRepository {
    func fetchComments(postId: Int, completion: @escaping CommentResult)
}
