//
//  OrderDetailCoordinator.swift
//  Coordinators
//
//  Created by Gleb Arkhipov on 11/07/2020.
//  Copyright © 2020 Gleb Arkhipov. All rights reserved.
//

import UIKit

protocol OrderDetailCoordinatorHandling: AnyObject {

    func handle(event: OrderDetailCoordinator.Event)
}

class OrderDetailCoordinator: NavigationControllerCoordinator, ParentCoordinated {

    enum Event {

        case dismiss
    }

    weak var parent: OrderDetailCoordinatorHandling?
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []

    init(navigationController: UINavigationController) {

        self.navigationController = navigationController

        start()
    }

    func start() {

        let isOrderSpecial = Bool.random()

        if isOrderSpecial {

            let orderDetailViewController = OrderDetailAViewController()
            orderDetailViewController.coordinator = self

            navigationController.pushViewController(orderDetailViewController, animated: true)
        } else {

            let orderDetailViewController = OrderDetailBViewController()
            orderDetailViewController.coordinator = self

            navigationController.pushViewController(orderDetailViewController, animated: true)
        }
    }
}

extension OrderDetailCoordinator: OrderDetailViewControllerHandling {

    func handle(event: OrderDetailEvent) {

        switch event {
        case .dismiss:

            parent?.handle(event: .dismiss)
        }
    }
}
