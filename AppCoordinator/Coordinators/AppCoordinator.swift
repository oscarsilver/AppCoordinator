//
//  AppCoordinator.swift
//  AppCoordinator
//
//  Created by Oscar Silver on 2017-11-15.
//  Copyright © 2017 Oscar Silver. All rights reserved.
//

import Foundation

protocol Coordinator: class {
    func start()
}

protocol AppCoordinatorProtocol: Coordinator { }

final class AppCoordinator: NSObject, AppCoordinatorProtocol {

    var childCoordinators: [Coordinator] = []

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
    func coordinatorDidAuthenticate(_ coordinator: AuthCoordinatorProtocol) {
        
    }
}

// MARK: Private Methods
private extension AppCoordinator {
    func showAuthentication() {
        let authCoordinator =  AuthCoordinator()
        childCoordinators.append(authCoordinator)
        authCoordinator.start()
    }

    func showMainScreen() {

    }
}
