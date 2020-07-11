//
//  ChatNavigationController.swift
//  Coordinators
//
//  Created by Gleb Arkhipov on 11/07/2020.
//  Copyright © 2020 Gleb Arkhipov. All rights reserved.
//

import UIKit

class ChatNavigationController: UINavigationController {

    override func viewDidLoad() {

        super.viewDidLoad()

        tabBarItem = UITabBarItem(
            title: "Chat",
            image: UIImage(systemName: "message"),
            selectedImage: UIImage(systemName: "message")
        )
    }
}
