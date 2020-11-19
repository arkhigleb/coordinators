//
//  BaseViewController.swift
//  Coordinators
//
//  Created by Gleb Arkhipov on 11/07/2020.
//  Copyright © 2020 Gleb Arkhipov. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {

        super.viewDidLoad()

        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)

        label.font = UIFont.systemFont(ofSize: 60, weight: .bold)
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

        label.text = title

        let colors = [
            UIColor.lightGray,
            UIColor.blue,
            UIColor.orange,
            UIColor.gray,
            UIColor.cyan
        ]
        view.backgroundColor = colors.randomElement()
    }
}
