//
//  AppCoordinator.swift
//  AppCoordinator
//
//  Created by Oscar Silver on 2017-11-15.
//  Copyright © 2017 Oscar Silver. All rights reserved.
//

import Foundation

protocol Coordinator {
    var identifier: String { get }
    func start()
}

struct AnyCoordinator: Coordinator, Equatable {
    let identifier: String
    private let _start: () -> ()

    init<U: Coordinator>(_ coordinator: U) {
        self.identifier = coordinator.identifier
        self._start = coordinator.start
    }

    func start() {
        _start()
    }

    static func ==(lhs: AnyCoordinator, rhs: AnyCoordinator) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}

extension Coordinator {
    var identifier: String {
        return String(describing: self)
    }
}

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

    }
}

extension Array where Element: Equatable {
    mutating func remove(_ element: Element) {
        self = self.filter { $0 == element }
    }
}
