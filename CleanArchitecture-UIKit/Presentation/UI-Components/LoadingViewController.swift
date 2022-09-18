//
//  LoadingViewController.swift
//  CleanArchitecture-UIKit
//
//  Created by Randy Efan Jayaputra on 18/09/22.
//

import UIKit

public class LoadingViewController: UIViewController {
    
    private let loadingIndicatorView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(frame: .zero)
        view.style = .medium
        view.hidesWhenStopped = true
        view.startAnimating()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLoadingIndicatorView()
    }
    
    private func setupLoadingIndicatorView() {
        view.addSubview(loadingIndicatorView)
        loadingIndicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loadingIndicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        loadingIndicatorView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        loadingIndicatorView.widthAnchor.constraint(equalToConstant: 24).isActive = true
    }
    
}

