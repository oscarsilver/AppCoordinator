//
//  Array+RemoveEquatable.swift
//  AppCoordinator
//
//  Created by Oscar Silver on 2017-11-16.
//  Copyright © 2017 Oscar Silver. All rights reserved.
//

import Foundation

extension Array where Element: Equatable {
    mutating func remove(_ element: Element) {
        if let index = index(of: element) {
            remove(at: index)
        }
    }
}
