//
//  UserRepository.swift
//  CleanArchitecture-UIKit
//
//  Created by Randy Efan Jayaputra on 17/09/22.
//

import Foundation

enum LoadUsersError: Error, Equatable {
    case invalidToken
    case invalidURL
    case serverError
    case noInternetConnection
    case invalidBundleURL
    case failToMakeDataOrDecodeUsersData
    case unknown(message: String)
}

protocol UserRepository {
    typealias UserResult = (Result<[User], LoadUsersError>) -> Void
    
    func fetchUsers(completion: @escaping UserResult)
}

