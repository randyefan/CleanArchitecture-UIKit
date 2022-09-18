//
//  AppDIContainer.swift
//  CleanArchitecture-UIKit
//
//  Created by Randy Efan Jayaputra on 18/09/22.
//

import Foundation

class AppDIContainer {
    
    // MARK: - Network
    lazy var postService: PostService = {
        let service: PostService = PostServiceImpl()
        return service
    }()
    
    lazy var CommentService: CommentService = {
        let service: CommentService = CommentServiceImpl()
        return service
    }()
    
    func makePostModuleDIContainer() -> PostModuleDIContainer {
        let dependency = PostModuleDIContainer.Dependency(postService: postService)
        return PostModuleDIContainer(dependency: dependency)
    }
    
}
