//
//  AuthCoordinator.swift
//  AppCoordinator
//
//  Created by Oscar Silver on 2017-11-15.
//  Copyright © 2017 Oscar Silver. All rights reserved.
//

import Foundation
import UIKit

protocol AuthCoordinatorDelegate: class {
    func viewControllerDidAuthenticate(_ viewController: UIViewController)
}

protocol AuthCoordinatorProtocol: Coordinator {
    weak var delegate: AppCoordinatorDelegate? { get }
}

final class AuthCoordinator: AuthCoordinatorProtocol {

    private let rootViewController: UIViewController
    var childCoordinators: [AnyCoordinator] = []
    weak var delegate: AppCoordinatorDelegate?

    init(rootViewController: UIViewController, delegate: AppCoordinatorDelegate? = nil) {
        self.rootViewController = rootViewController
        self.delegate = delegate
    }

    func start() {
        let authController = AuthViewController(nibName: nil, bundle: nil)
        authController.delegate = self
        rootViewController.present(authController, animated: true, completion: nil)
    }
}

// MARK: AuthCoordinatorDelegate
extension AuthCoordinator: AuthCoordinatorDelegate {
    func viewControllerDidAuthenticate(_ viewController: UIViewController) {
        viewController.dismiss(animated: true) {
            self.delegate?.authCoordinatorDidAuthenticate(AnyCoordinator(self))
        }
    }
}
