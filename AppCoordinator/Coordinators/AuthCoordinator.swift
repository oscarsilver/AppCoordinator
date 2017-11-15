//
//  AuthCoordinator.swift
//  AppCoordinator
//
//  Created by Oscar Silver on 2017-11-15.
//  Copyright © 2017 Oscar Silver. All rights reserved.
//

import Foundation

protocol AuthCoordinatorDelegate: class {
    func coordinatorDidAuthenticate(_ coordinator: AuthCoordinator)
}

protocol AuthCoordinatorProtocol: Coordinator {
    weak var delegate: AuthCoordinatorDelegate? { get }
}

final class AuthCoordinator: AuthCoordinatorProtocol {
    static func ==(lhs: AuthCoordinator, rhs: AuthCoordinator) -> Bool {
        return true
    }

    weak var delegate: AuthCoordinatorDelegate?

    func start() {
        print("Starting authentication flow")
    }
}
