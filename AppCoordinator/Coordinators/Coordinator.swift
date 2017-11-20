//
//  Coordinator.swift
//  AppCoordinator
//
//  Created by Oscar Silver on 2017-11-16.
//  Copyright © 2017 Oscar Silver. All rights reserved.
//

import Foundation

protocol Coordinator: class {
    var childCoordinators: [Coordinator] { get set }
    func start()
}

extension Coordinator {
    func remove(_ coordinator: Coordinator) {
        if let index = childCoordinators.index(where: { $0 === coordinator }) {
            childCoordinators.remove(at: index)
        }
    }
}
