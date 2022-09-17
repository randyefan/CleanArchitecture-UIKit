//
//  UserRepository.swift
//  CleanArchitecture-UIKit
//
//  Created by Randy Efan Jayaputra on 17/09/22.
//

import Foundation

typealias UserResult = (Result<[User], LoadUsersError>) -> Void

protocol UserRepository {
    func fetchUsers(completion: @escaping UserResult)
}

