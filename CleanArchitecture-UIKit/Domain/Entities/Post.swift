//
//  Post.swift
//  CleanArchitecture-UIKit
//
//  Created by Randy Efan Jayaputra on 17/09/22.
//

import Foundation

struct Post: Codable {
    var userId: Int?
    var id: Int?
    var title: String?
    var body: String?
    
    enum CodingKeys: String, CodingKey {
        case userId = "userId"
        case id = "id"
        case title = "title"
        case body = "body"
    }
}
