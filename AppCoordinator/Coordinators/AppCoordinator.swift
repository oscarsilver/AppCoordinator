//
//  AppCoordinator.swift
//  AppCoordinator
//
//  Created by Oscar Silver on 2017-11-15.
//  Copyright © 2017 Oscar Silver. All rights reserved.
//

import Foundation

protocol Coordinator: class, Equatable {
    func start()
}

protocol AppCoordinatorProtocol: Coordinator { }

final class AppCoordinator: AppCoordinatorProtocol {
    static func ==(lhs: AppCoordinator, rhs: AppCoordinator) -> Bool {
        return true
    }

//    var childCoordinators: [Coordinator] = []

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
    func coordinatorDidAuthenticate(_ coordinator: AuthCoordinator) {
//        childCoordinators.
    }
}

// MARK: Private Methods
private extension AppCoordinator {
    func showAuthentication() {
        let authCoordinator = AuthCoordinator()
//        childCoordinators.append(authCoordinator)
        authCoordinator.start()
    }

    func showMainScreen() {

    }
}
