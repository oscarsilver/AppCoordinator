//
//  AuthViewController.swift
//  AppCoordinator
//
//  Created by Oscar Silver on 2017-11-16.
//  Copyright © 2017 Oscar Silver. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {

    private lazy var button: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("Authenticate", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(self.didPressAuthenticateButton(_:)), for: .touchUpInside)
        return button
    }()

    weak var delegate: AuthCoordinatorDelegate?

    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
}

// MARK: Selector Methods
extension AuthViewController {
    @objc func didPressAuthenticateButton(_ sender: UIButton) {
        delegate?.viewControllerDidAuthenticate(self)
    }
}

// MARK: Private Methods
private extension AuthViewController {
    func setupViews() {
        view.backgroundColor = .white
        view.addSubview(button)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
    }
}
