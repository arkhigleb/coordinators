//
//  ChatCoordinator.swift
//  Coordinators
//
//  Created by Gleb Arkhipov on 11/07/2020.
//  Copyright © 2020 Gleb Arkhipov. All rights reserved.
//

import UIKit

protocol ChatCoordinatorHandling: AnyObject {

    func handle(event: ChatCoordinator.Event)
}

class ChatCoordinator: NavigationControllerCoordinator, ParentCoordinated {

    enum Event {
        
    }

    weak var parent: ChatCoordinatorHandling?
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []

    init(navigationController: UINavigationController) {

        self.navigationController = navigationController

        start()
    }

    func start() {

        let chatViewController = ChatViewController()
        chatViewController.coordinator = self

        navigationController.setViewControllers([
            chatViewController
        ], animated: false)
    }
}

extension ChatCoordinator: ChatViewControllerHandling {

    func handle(event: ChatViewController.Event) {

        switch event {
        case .showSettings:

            let settingsCoordinator = SettingsCoordinator(
                navigationController: SettingsNavigationController()
            )
            settingsCoordinator.parent = self
            childCoordinators.append(settingsCoordinator)

            navigationController.present(
                settingsCoordinator.navigationController,
                animated: true
            )
        }
    }
}

extension ChatCoordinator: SettingsCoordinatorHandling {

    func handle(event: SettingsCoordinator.Event) {

        childCoordinators.removeAll { $0 is SettingsCoordinator }
    }
}
