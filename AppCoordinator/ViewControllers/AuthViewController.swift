//
//  AuthViewController.swift
//  AppCoordinator
//
//  Created by Oscar Silver on 2017-11-16.
//  Copyright © 2017 Oscar Silver. All rights reserved.
//

import UIKit

typealias AuthenticationCallback = (UIViewController) -> Void

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

    private let didAuthenticate: AuthenticationCallback

    // MARK: Initialization
    init(didAuthenticate: @escaping AuthenticationCallback) {
        self.didAuthenticate = didAuthenticate
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

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
        didAuthenticate(self)
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
