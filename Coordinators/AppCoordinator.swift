//
//  AppCoordinator.swift
//  Coordinators
//
//  Created by Gleb Arkhipov on 11/07/2020.
//  Copyright © 2020 Gleb Arkhipov. All rights reserved.
//

import UIKit

class AppCoordinator {

    let window: UIWindow
    var rootCoordinator: Coordinator?

    init(window: UIWindow) {

        self.window = window

        start()
    }

    func start() {

        let userIsLoggedIn = Bool.random()

        if userIsLoggedIn {

            showMainTabBar()
        } else {

            showLogin()
        }

        window.makeKeyAndVisible()
    }

    func showMainTabBar() {

        let tabBarController = UITabBarController()
        let mainTabBarCoordinator = MainTabBarCoordinator(tabBarController: tabBarController)
        mainTabBarCoordinator.parent = self
        rootCoordinator = mainTabBarCoordinator

        window.rootViewController = tabBarController
    }

    func showLogin() {

        let navigationController = UINavigationController()
        let loginCoordinator = LoginCoordinator(navigationController: navigationController)
        loginCoordinator.parent = self
        rootCoordinator = loginCoordinator

        window.rootViewController = navigationController
    }
}

extension AppCoordinator: MainTabBarCoordinatorHandling {

    func handle(event: MainTabBarCoordinator.Event) {

    }
}

extension AppCoordinator: LoginCoordinatorHandling {

    func handle(event: LoginCoordinator.Event) {

        switch event {
        case .login:

            showMainTabBar()
        }
    }
}
