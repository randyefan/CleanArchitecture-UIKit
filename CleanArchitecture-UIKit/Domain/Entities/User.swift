//
//  User.swift
//  CleanArchitecture-UIKit
//
//  Created by Randy Efan Jayaputra on 17/09/22.
//

import Foundation

struct User: Codable, Equatable {
    var id: Int?
    var name: String?
    var username: String?
    var email: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case username = "username"
        case email = "email"
    }
}
