//
//  ChatViewController.swift
//  Coordinators
//
//  Created by Gleb Arkhipov on 11/07/2020.
//  Copyright © 2020 Gleb Arkhipov. All rights reserved.
//

import UIKit

protocol ChatViewControllerHandling: AnyObject {

    func handle(event: ChatViewController.Event)
}

class ChatViewController: BaseViewController, Coordinated {

    enum Event {
        case showSettings
    }

    weak var coordinator: ChatViewControllerHandling?

    override func viewDidLoad() {

        title = "CHAT"

        super.viewDidLoad()

        let button = UIButton()
        view.addSubview(button)

        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 5
        button.setTitle("Show settings", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action:  #selector(didTapSettings), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false

        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -80).isActive = true
        button.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
    }

    @objc func didTapSettings() {

        coordinator?.handle(event: .showSettings)
    }
}
