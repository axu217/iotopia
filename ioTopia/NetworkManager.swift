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
    var headers: HTTPHeaders =  [
        "Authorization": "Token QWxhZGRpbjpvcGVuIHNlc2FtZQ=="
    ]
    
    
    override init() {
        super.init()
    }
    
    func login(username: String, password: String, completionHandler: @escaping (String, NSError?) -> ()){
        
        let parameters: Parameters = ["username": username, "password": password]
        let loginPathAddon = "/rest_api/api-token-auth/"
        
        Alamofire.request(path+loginPathAddon, method: .post, parameters: parameters).responseJSON { response in
            switch response.result {
                
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                self.headers["Authorization"] = "Token " + json["token"].stringValue
                completionHandler("yo", nil)
            case .failure(let error):
                print(error)
                completionHandler("error", error as NSError?)
            }
            
        
        }
    }

    func getUserCredits(completionHandler: @escaping ([String: Double], NSError?) -> ()){
        
        
        let parameters: Parameters = [:]
        let loginPathAddon = "/rest_api/get_credit_balances/"
        

        
        
        Alamofire.request(path+loginPathAddon, method: .get, parameters: parameters, headers: headers).responseJSON { response in
            var toReturn: [String: Double] = [String: Double]();
            switch response.result {
            case .success(let value):
                let credits = JSON(value)
                print(self.headers)
                print(credits)
                print("yo")
                
                let first = credits[0]
                let second = credits[1]
                let type = first["credit_type_id"].intValue
                let value = first["balance"].doubleValue
                var temp: String
                if(type == 1) {
                    temp = "Power"
                } else {
                    temp = "Water"
                }
                
                toReturn[temp] = value

                let type2 = second["credit_type_id"].intValue
                let value2 = second["balance"].doubleValue
                var temp2: String
                if(type2 == 1) {
                    temp2 = "Power"
                } else {
                    temp2 = "Water"
                }
                
                toReturn[temp2] = value2
                
                completionHandler(toReturn, nil)
                
            case .failure(let error):
                print(error)
                print("error")
                
            }
            
            
        }
        
        
    }
    
    func getUsers(completionHandler: @escaping (UserBase, NSError?) -> ()){
        let parameters: Parameters = [:]
        let loginPathAddon = "/rest_api/get_users/"
        
        Alamofire.request(path+loginPathAddon, method: .get, parameters: parameters, headers: headers).responseJSON { response in
            let userList: UserBase = UserBase()
            switch response.result {
                
            case .success(let value):
                let users = JSON(value)
                
                let temp = users.count
                for i in 0...temp-1 {
                    
                    let user = users[i]
                    let id = user["id"].intValue;
                    let username = user["username"].stringValue;
                    let owner = user["owner"].stringValue;
                    let place = user["place"].stringValue;
                    let tempUser = User(id: id, username: username, owner: owner, place: place);
                    userList.addUser(user: tempUser);
                }
                
                completionHandler(userList, nil)
                
                
            case .failure(let error):
                print(error)
                print("shiet")
                
            }
            
            
        }
    }
    
    func sendGift(id: Int, type: Int, quantity: Double, completionHandler: @escaping (String, NSError?) -> ()){
        let parameters: Parameters = ["to_user_id":id, "credit_type_id":type, "quantity":quantity]
        let loginPathAddon = "/rest_api/gift_credit/"
        
        Alamofire.request(path+loginPathAddon, method: .post, parameters: parameters, headers: headers).responseJSON { response in
            switch response.result {
                
            case .success(let value):
                
                completionHandler("yolo", nil)
                
                
            case .failure(let error):
                print(error)
                completionHandler("yolo", error as NSError)
                
            }
            
            
        }
    }
    
}
