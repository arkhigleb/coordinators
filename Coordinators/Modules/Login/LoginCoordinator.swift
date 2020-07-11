//
//  LoginCoordinator.swift
//  Coordinators
//
//  Created by Gleb Arkhipov on 11/07/2020.
//  Copyright © 2020 Gleb Arkhipov. All rights reserved.
//

import UIKit

protocol LoginCoordinatorHandling: AnyObject {

    func handle(event: LoginCoordinator.Event)
}

class LoginCoordinator: NavigationControllerCoordinator, ParentCoordinated {

    enum Event {

        case login
    }

    weak var parent: LoginCoordinatorHandling?
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []

    init(navigationController: UINavigationController) {

        self.navigationController = navigationController

        start()
    }

    func start() {

        let loginViewController = LoginViewController()
        loginViewController.coordinator = self

        navigationController.setViewControllers([
            loginViewController
        ], animated: false )
    }
}

extension LoginCoordinator: LoginViewControllerHandling {

    func handle(event: LoginViewController.Event) {

        parent?.handle(event: .login)
    }
}
