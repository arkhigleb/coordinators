//
//  SettingsNavigationController.swift
//  Coordinators
//
//  Created by Gleb Arkhipov on 11/07/2020.
//  Copyright © 2020 Gleb Arkhipov. All rights reserved.
//

import UIKit

class SettingsNavigationController: UINavigationController {

    override func viewDidLoad() {

        super.viewDidLoad()

        presentationController?.delegate = self
    }
}

extension SettingsNavigationController: UIAdaptivePresentationControllerDelegate {

    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {

        viewControllers.compactMap { $0 as? SettingsViewController }
            .first?
            .coordinator?
            .handle(event: .dismiss)
    }
}
