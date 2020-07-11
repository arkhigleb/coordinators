//
//  OrderCoordinator.swift
//  Coordinators
//
//  Created by Gleb Arkhipov on 11/07/2020.
//  Copyright © 2020 Gleb Arkhipov. All rights reserved.
//

import UIKit

protocol OrderCoordinatorHandling: AnyObject {

    func handle(event: OrderCoordinator.Event)
}

class OrderCoordinator: NavigationControllerCoordinator, ParentCoordinated {

    enum Event {

    }

    weak var parent: OrderCoordinatorHandling?
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []

    init(navigationController: UINavigationController) {

        self.navigationController = navigationController

        start()
    }

    func start() {

        let orderViewController = OrderViewController()
        orderViewController.coordinator = self

        navigationController.setViewControllers([
            orderViewController
        ], animated: false)
    }
}

extension OrderCoordinator: OrderViewControllerHandling {

    func handle(event: OrderViewController.Event) {

        switch event {
        case .detail:

            let orderDetailCoordinator = OrderDetailCoordinator(navigationController: navigationController)
            orderDetailCoordinator.parent = self
            childCoordinators.append(orderDetailCoordinator)
        }
    }
}

extension OrderCoordinator: OrderDetailCoordinatorHandling {

    func handle(event: OrderDetailCoordinator.Event) {

        switch event {
        case .dismiss:

            childCoordinators.removeAll { $0 is OrderDetailCoordinator }
        }
    }
}
