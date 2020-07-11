//
//  MainTabBarCoordinator.swift
//  Coordinators
//
//  Created by Gleb Arkhipov on 11/07/2020.
//  Copyright © 2020 Gleb Arkhipov. All rights reserved.
//

import UIKit

protocol MainTabBarCoordinatorHandling: AnyObject {

    func handle(event: MainTabBarCoordinator.Event)
}

class MainTabBarCoordinator: TabBarControllerCoordinator, ParentCoordinated {

    enum Event {

    }

    weak var parent: MainTabBarCoordinatorHandling?
    var tabBarController: UITabBarController
    var childCoordinators: [Coordinator] = []

    init(tabBarController: UITabBarController) {

        self.tabBarController = tabBarController

        start()
    }

    func start() {

        let chatNavigationController = ChatNavigationController()
        let chatCoordinator = ChatCoordinator(navigationController: chatNavigationController)
        chatCoordinator.parent = self
        childCoordinators.append(chatCoordinator)

        let orderNavigationController = OrderNavigationController()
        let orderCoordinator = OrderCoordinator(navigationController: orderNavigationController)
        orderCoordinator.parent = self
        childCoordinators.append(orderCoordinator)

        tabBarController.setViewControllers([
            chatNavigationController,
            orderNavigationController
        ], animated: true)
    }
}

extension MainTabBarCoordinator: ChatCoordinatorHandling {

    func handle(event: ChatCoordinator.Event) {

    }
}

extension MainTabBarCoordinator: OrderCoordinatorHandling {

    func handle(event: OrderCoordinator.Event) {

    }
}
