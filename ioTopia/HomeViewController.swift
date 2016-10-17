//
//  HomeViewController.swift
//  ioTopia
//
//  Created by AXE07 on 10/9/16.
//  Copyright © 2016 ZheChengXu. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet var currentCreditLabel: UILabel!
    let networkManager: NetworkManager = (UIApplication.shared.delegate as! AppDelegate).networkManager

    override func viewDidLoad() {
        
        
        super.viewDidLoad()
    }

}
