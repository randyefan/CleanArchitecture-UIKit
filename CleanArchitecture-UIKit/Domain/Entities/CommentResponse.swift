//
//  CommentResponse.swift
//  CleanArchitecture-UIKit
//
//  Created by Randy Efan Jayaputra on 17/09/22.
//

import Foundation

struct CommentResponse: Codable, Equatable {
    var postID: Int?
    var id: Int?
    var name: String?
    var email: String?
    var body: String?
    
    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case id = "id"
        case name = "name"
        case email = "email"
        case body = "body"
    }
}
