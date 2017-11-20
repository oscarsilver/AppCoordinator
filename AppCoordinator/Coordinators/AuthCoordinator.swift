//
//  AuthCoordinator.swift
//  AppCoordinator
//
//  Created by Oscar Silver on 2017-11-15.
//  Copyright © 2017 Oscar Silver. All rights reserved.
//

import Foundation
import UIKit

typealias AuthenticationCoordinatorCallback = (AuthCoordinator) -> Void

protocol AuthCoordinatorProtocol: Coordinator { }

final class AuthCoordinator: AuthCoordinatorProtocol {
    private let rootViewController: UIViewController
    private let didAuthenticate: AuthenticationCoordinatorCallback
    var childCoordinators: [Coordinator] = []

    init(rootViewController: UIViewController,
         didAuthenticate: @escaping AuthenticationCoordinatorCallback
        ) {
        self.rootViewController = rootViewController
        self.didAuthenticate = didAuthenticate
    }

    func start() {
        let authController = AuthViewController(didAuthenticate: viewControllerDidAuthenticate)
        rootViewController.present(authController, animated: true, completion: nil)
    }
}

// MARK: Authentication Callbacks
extension AuthCoordinator {
    func viewControllerDidAuthenticate(_ viewController: UIViewController) {
        viewController.dismiss(animated: true) {
            self.didAuthenticate(self)
        }
    }
}
