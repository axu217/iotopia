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
    var token = "";
    
    override init() {
        super.init()
    }
    
    func login(username: String, password: String) {
        
        let parameters: Parameters = ["username": username, "password": password]
        let loginPathAddon = "/rest_api/api-token-auth/"
        
        Alamofire.request(path+loginPathAddon, method: .post, parameters: parameters).responseJSON { response in
            switch response.result {
                
            case .success(let value):
                let json = JSON(value)
                self.token = json["token"].stringValue
                print("JSON: \(json)")
                LoginScreenViewController.onLoginSuccess()
            case .failure(let error):
                print(error)
                LoginScreenViewController.onLoginFailure()

            }
            
        
        }
    }
    
    func register(username: String, password: String, email: String) {
        
        let parameters: Parameters = ["username": username, "password": password, "email": email]
        let loginPathAddon = "/rest_api/api-token-auth/"
        
        Alamofire.request(path+loginPathAddon, method: .post, parameters: parameters).responseJSON { response in
            switch response.result {
                
            case .success(let value):
                let json = JSON(value)
                self.token = json["token"].stringValue
                print("JSON: \(json)")
                RegisterViewController.onRegisterSuccess()
            case .failure(let error):
                print(error)
                RegisterViewController.onRegisterFailure()
                
            }
            
            
        }
    }
    
}
