//
//  OrderNavigationController.swift
//  Coordinators
//
//  Created by Gleb Arkhipov on 11/07/2020.
//  Copyright © 2020 Gleb Arkhipov. All rights reserved.
//

import UIKit

class OrderNavigationController: UINavigationController {

    override func viewDidLoad() {

        super.viewDidLoad()

        tabBarItem = UITabBarItem(
            title: "Orders",
            image: UIImage(systemName: "list.bullet"),
            selectedImage: UIImage(systemName: "list.bullet")
        )

        delegate = self
    }
}

extension OrderNavigationController: UINavigationControllerDelegate {

    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {

        guard
            let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from),
            !navigationController.viewControllers.contains(fromViewController)
        else {

            return
        }

        if let orderDetailViewController = fromViewController as? OrderDetailAViewController {

            orderDetailViewController.coordinator?.handle(event: .dismiss)
        }

        if let orderDetailViewController = fromViewController as? OrderDetailBViewController {

            orderDetailViewController.coordinator?.handle(event: .dismiss)
        }
    }
}
