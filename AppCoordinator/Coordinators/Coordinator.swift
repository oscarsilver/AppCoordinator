//
//  Coordinator.swift
//  AppCoordinator
//
//  Created by Oscar Silver on 2017-11-16.
//  Copyright © 2017 Oscar Silver. All rights reserved.
//

import Foundation

protocol Coordinator {
    var childCoordinators: [AnyCoordinator] { get set }
    var identifier: String { get }
    func start()
}

extension Coordinator {
    var identifier: String {
        return String(describing: self)
    }
}

// MARK: Coordinator Type Erasure
struct AnyCoordinator: Coordinator, Equatable {
    let identifier: String
    var childCoordinators: [AnyCoordinator]
    private let _start: () -> ()

    init<U: Coordinator>(_ coordinator: U) {
        self.identifier = coordinator.identifier
        self.childCoordinators = coordinator.childCoordinators
        self._start = coordinator.start
    }

    func start() {
        _start()
    }

    static func ==(lhs: AnyCoordinator, rhs: AnyCoordinator) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}


