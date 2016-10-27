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
    @IBOutlet var powerCredits: UILabel!
    @IBOutlet var waterCredits: UILabel!
    let networkManager: NetworkManager = (UIApplication.shared.delegate as! AppDelegate).networkManager

    override func viewDidLoad() {
    
        super.viewDidLoad()
        
        fetchUserData() { response, error in
            if((error) != nil) {
                print(error)
            }
            let temp = response["Power"]
            let temp2 = response["Water"]
            self.powerCredits.text = String(format:"%f", temp!)
            self.waterCredits.text = String(format:"%f", temp2!)
        }
    }
    
    func fetchUserData(completionHandler: @escaping ([String: Double], NSError?) -> ()) {
        networkManager.getUserCredits(completionHandler: completionHandler)
    }

}
