//
//  TabViewController.swift
//  ioTopia
//
//  Created by AXE07 on 10/27/16.
//  Copyright © 2016 ZheChengXu. All rights reserved.
//

import UIKit

class TabViewController: UITabBarController {
    
    var freshLaunch = true
    override func viewWillAppear(_ animated: Bool) {
        if freshLaunch == true {
            freshLaunch = false
            self.selectedIndex = 1 // 5th tab
        }
    }
}
