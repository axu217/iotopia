//
//  SendCreditFinalViewController.swift
//  ioTopia
//
//  Created by AXE07 on 10/26/16.
//  Copyright © 2016 ZheChengXu. All rights reserved.
//

import UIKit

class SendCreditFinalViewController: UIViewController {

    let networkManager: NetworkManager = (UIApplication.shared.delegate as! AppDelegate).networkManager

    var id: Int = -1;
    
    @IBOutlet var amount: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func sendPower(_ sender: AnyObject) {
        print("sending power now")
        networkManager.sendGift(id: id, type: 1, quantity: Double(amount.text!)!) {result, error in

            
        }
    }
    
    @IBAction func sendWater(_ sender: AnyObject) {
        networkManager.sendGift(id: id, type: 2, quantity: Double(amount.text!)!) {result, error in
            
            
        }
    }
}
