//
//  SettingsCoordinator.swift
//  Coordinators
//
//  Created by Gleb Arkhipov on 11/07/2020.
//  Copyright © 2020 Gleb Arkhipov. All rights reserved.
//

import UIKit

protocol SettingsCoordinatorHandling: AnyObject {

    func handle(event: SettingsCoordinator.Event)
}

class SettingsCoordinator: NavigationControllerCoordinator, ParentCoordinated {

    enum Event {

        case dismiss
    }

    weak var parent: SettingsCoordinatorHandling?
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []

    init(navigationController: UINavigationController) {

        self.navigationController = navigationController

        start()
    }

    func start() {

        let settingsViewController = SettingsViewController()
        settingsViewController.coordinator = self

        navigationController.setViewControllers([
            settingsViewController
        ], animated: false )
    }
}

extension SettingsCoordinator: SettingsViewControllerHandling {

    func handle(event: SettingsViewController.Event) {

        parent?.handle(event: .dismiss)
    }
}
