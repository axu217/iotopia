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
    @IBOutlet var waterCreditBar: CreditBarView!
    @IBOutlet var powerCreditBar: CreditBarView!
    @IBOutlet var waterCreditLabel: UILabel!
    
    
    let networkManager: NetworkManager = (UIApplication.shared.delegate as! AppDelegate).networkManager

    override func viewDidLoad() {
    
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        fetchUserData() { response, error in
            if((error) != nil) {
                print(error)
            }
            let temp = response["Power"]
            let temp2 = response["Water"]
            
            self.waterCreditBar.setBarValue(temp: Int(temp2!))
            self.waterCreditBar.setBarMax(temp: 5000)
            
            self.powerCreditBar.setBarValue(temp: Int(temp!))
            self.powerCreditBar.setBarMax(temp: 5000)
            
            self.waterCreditBar.setNeedsDisplay()
            self.powerCreditBar.setNeedsDisplay()
            
            self.waterCreditLabel.text = String(Int(temp!) + Int(temp2!))
        }
    }
    
    func fetchUserData(completionHandler: @escaping ([String: Double], NSError?) -> ()) {
        networkManager.getUserCredits(completionHandler: completionHandler)
    }

}
