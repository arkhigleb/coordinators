//
//  LoginViewController.swift
//  Coordinators
//
//  Created by Gleb Arkhipov on 11/07/2020.
//  Copyright © 2020 Gleb Arkhipov. All rights reserved.
//

import UIKit

protocol LoginViewControllerHandling: AnyObject {

    func handle(event: LoginViewController.Event)
}

class LoginViewController: BaseViewController, Coordinated {

    enum Event {

        case login
    }

    weak var coordinator: LoginViewControllerHandling?

    override func viewDidLoad() {

        title = "LOGIN"
        super.viewDidLoad()

        let button = UIButton()
        view.addSubview(button)

        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 5
        button.setTitle("Login", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action:  #selector(didTapLogin), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false

        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -80).isActive = true
        button.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
    }

    @objc func didTapLogin() {

        coordinator?.handle(event: .login)
    }
}

