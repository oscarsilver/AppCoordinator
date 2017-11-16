//
//  AppCoordinator.swift
//  AppCoordinator
//
//  Created by Oscar Silver on 2017-11-15.
//  Copyright © 2017 Oscar Silver. All rights reserved.
//

import Foundation
import UIKit

protocol AppCoordinatorDelegate: class {
    func authCoordinatorDidAuthenticate(_ coordinator: AnyCoordinator)
}

protocol AppCoordinatorProtocol: Coordinator {}

final class AppCoordinator: AppCoordinatorProtocol {

    var childCoordinators: [AnyCoordinator] = []
    var isAuthenticated: Bool = false

    private let rootViewController: UINavigationController

    // MARK: Initialization
    init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
    }

    // MARK: Coordinator
    func start() {
        if isAuthenticated {
            showMainScreen()
        } else {
            showAuthentication()
        }
    }
}

// MARK: AuthCoordinatorDelegate
extension AppCoordinator: AppCoordinatorDelegate {
    func authCoordinatorDidAuthenticate(_ coordinator: AnyCoordinator) {
        childCoordinators.remove(coordinator)
        showMainScreen()
    }
}

// MARK: Private Methods
private extension AppCoordinator {
    func showAuthentication() {
        let authCoordinator = AnyCoordinator(AuthCoordinator(rootViewController: rootViewController, delegate: self))
        childCoordinators.append(authCoordinator)
        authCoordinator.start()
    }

    func showMainScreen() {
        let mainViewController = MainViewController(nibName: nil, bundle: nil)
        rootViewController.pushViewController(mainViewController, animated: false)
    }
}
