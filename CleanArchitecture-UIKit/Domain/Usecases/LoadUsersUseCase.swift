//
//  LoadUsersUseCase.swift
//  CleanArchitecture-UIKit
//
//  Created by Randy Efan Jayaputra on 17/09/22.
//

import Foundation

/// Error State
enum LoadUsersError: Error, Equatable {
    case invalidToken
    case invalidURL
    case serverError
    case noInternetConnection
    case invalidBundleURL
    case failToMakeDataOrDecodeUsersData
    case unknown(message: String)
}

protocol LoadUsersUseCase {
    func execute(completion: @escaping UserResult)
}

class LoadUsersUseCaseImpl: LoadUsersUseCase {
    private let repository: UserRepository
    
    init(repository: UserRepository) {
        self.repository = repository
    }
    
    func execute(completion: @escaping UserResult) {
        repository.fetchUsers { result in
            switch result {
            case .success(let users):
                completion(.success(users))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
