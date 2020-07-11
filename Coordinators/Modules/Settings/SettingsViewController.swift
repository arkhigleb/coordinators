//
//  SettingsViewController.swift
//  Coordinators
//
//  Created by Gleb Arkhipov on 11/07/2020.
//  Copyright © 2020 Gleb Arkhipov. All rights reserved.
//

import UIKit

protocol SettingsViewControllerHandling: AnyObject {

    func handle(event: SettingsViewController.Event)
}

class SettingsViewController: BaseViewController, Coordinated {

    enum Event {

        case dismiss
    }

    weak var coordinator: SettingsViewControllerHandling?

    override func viewDidLoad() {

        title = "SETTINGS"

        super.viewDidLoad()
    }
}
