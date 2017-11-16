//
//  AppCoordinator.swift
//  AppCoordinator
//
//  Created by Oscar Silver on 2017-11-15.
//  Copyright © 2017 Oscar Silver. All rights reserved.
//

import Foundation

protocol AppCoordinatorProtocol: Coordinator {}

final class AppCoordinator: AppCoordinatorProtocol {

    var childCoordinators: [AnyCoordinator] = []
    var isAuthenticated: Bool = false

    func start() {
        if isAuthenticated {
            showMainScreen()
        } else {
            showAuthentication()
        }
    }
}

// MARK: AuthCoordinatorDelegate
extension AppCoordinator: AuthCoordinatorDelegate {
    func coordinatorDidAuthenticate(_ coordinator: AnyCoordinator) {
        childCoordinators.remove(coordinator)
        showMainScreen()
    }
}

// MARK: Private Methods
private extension AppCoordinator {
    func showAuthentication() {
        let authCoordinator = AnyCoordinator(AuthCoordinator())
        childCoordinators.append(authCoordinator)
        authCoordinator.start()
    }

    func showMainScreen() {
        print("showing main screen")
    }
}
