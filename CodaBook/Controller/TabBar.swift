//
//  TabBar.swift
//  CodaBook
//
//  Created by Snoopy on 12/07/2018.
//  Copyright © 2018 EMANET. All rights reserved.
//

import UIKit

class TabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = .black
        tabBar.isTranslucent = false
        tabBar.barTintColor = BLEU_CODABOOK
    }

}
