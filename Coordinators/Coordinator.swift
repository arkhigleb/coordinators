//
//  Coordinator.swift
//  Coordinators
//
//  Created by Gleb Arkhipov on 11/07/2020.
//  Copyright © 2020 Gleb Arkhipov. All rights reserved.
//

import UIKit

protocol Coordinator: AnyObject {

    var childCoordinators: [Coordinator] { get set }

    func start()
}

protocol ParentCoordinated: AnyObject {

    associatedtype Parent

    var parent: Parent? { get set }
}

protocol Coordinated: AnyObject {

    associatedtype Coordinator

    var coordinator: Coordinator? { get set }
}

protocol TabBarControllerCoordinator: Coordinator {

    var tabBarController: UITabBarController { get }
}

protocol NavigationControllerCoordinator: Coordinator {

    var navigationController: UINavigationController { get }
}
