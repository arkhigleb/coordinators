//
//  OrderViewController.swift
//  Coordinators
//
//  Created by Gleb Arkhipov on 11/07/2020.
//  Copyright © 2020 Gleb Arkhipov. All rights reserved.
//

import UIKit

protocol OrderViewControllerHandling: AnyObject {

    func handle(event: OrderViewController.Event)
}

class OrderViewController: BaseViewController, Coordinated {

    enum Event {

        case detail
    }

    weak var coordinator: OrderViewControllerHandling?

    override func viewDidLoad() {

        title = "ORDERS"

        super.viewDidLoad()
        let button = UIButton()
        view.addSubview(button)

        button.setTitle("Show detail", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action:  #selector(didTapDetail), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false

        button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        button.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
     }

     @objc func didTapDetail() {

         coordinator?.handle(event: .detail)
     }
}
