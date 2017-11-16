//
//  AppDelegate.swift
//  AppCoordinator
//
//  Created by Oscar Silver on 2017-11-15.
//  Copyright © 2017 Oscar Silver. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    private lazy var rootViewController: UINavigationController = UINavigationController()
    private lazy var appCoordinator: AppCoordinatorProtocol = AppCoordinator(rootViewController: self.rootViewController)
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        showGUI()
        return true
    }
}

// MARK: Private Methods
private extension AppDelegate {
    func showGUI() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
        appCoordinator.start()
    }
}
