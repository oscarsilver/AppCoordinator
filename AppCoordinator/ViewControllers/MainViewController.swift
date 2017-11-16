//
//  MainViewController.swift
//  AppCoordinator
//
//  Created by Oscar Silver on 2017-11-16.
//  Copyright © 2017 Oscar Silver. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    private lazy var label: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Main screen"
        return label
    }()

    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
}

// MARK: Private Methods
private extension MainViewController {
    func setupViews() {
        view.backgroundColor = .white
        view.addSubview(label)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
    }
}
