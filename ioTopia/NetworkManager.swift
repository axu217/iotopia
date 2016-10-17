//
//  NetworkManager.swift
//  ioTopia
//
//  Created by AXE07 on 10/16/16.
//  Copyright © 2016 ZheChengXu. All rights reserved.
//

import Alamofire
import SwiftyJSON

class NetworkManager: NSObject {
    
    let path = "https://cory406.eecs.berkeley.edu";
    let token = "";
    
    override init() {
        super.init()
    }
    
    func login(username: String, password: String) {
        
        let parameters: Parameters = ["username": username, "password": password]
        
        Alamofire.request(path+"/rest_api/api-token-auth/", method: .post, parameters: parameters).responseJSON { response in
            switch response.result {
                
            case .success(let value):
                let json = JSON(value)
                token = json["token"]
                print("JSON: \(json)")
                LoginScreenViewController.onLoginSuccess()
            case .failure(let error):
                print(error)
                LoginScreenViewController.onLoginFailure()

            }
            
        
        }
    }
    
}
