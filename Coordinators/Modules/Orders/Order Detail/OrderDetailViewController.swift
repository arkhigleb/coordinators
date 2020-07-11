//
//  OrderDetailViewController.swift
//  Coordinators
//
//  Created by Gleb Arkhipov on 11/07/2020.
//  Copyright © 2020 Gleb Arkhipov. All rights reserved.
//

import UIKit

protocol OrderDetailViewControllerHandling: AnyObject {

    func handle(event: OrderDetailEvent)
}

enum OrderDetailEvent {

    case dismiss
}

class OrderDetailAViewController: BaseViewController, Coordinated {

    weak var coordinator: OrderDetailViewControllerHandling?

    override func viewDidLoad() {

        title = "DETAIL A"

        super.viewDidLoad()
    }
}

class OrderDetailBViewController: BaseViewController, Coordinated {

    weak var coordinator: OrderDetailViewControllerHandling?

    override func viewDidLoad() {

        title = "DETAIL B"

        super.viewDidLoad()
    }
}
