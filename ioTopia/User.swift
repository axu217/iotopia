//
//  User.swift
//  ioTopia
//
//  Created by AXE07 on 10/26/16.
//  Copyright © 2016 ZheChengXu. All rights reserved.
//

import Foundation

class User{
    
    var id: Int;
    var username: String;
    var owner: String;
    var place: String;
    
    init(id: Int, username: String, owner: String, place: String) {
        self.id = id;
        self.username = username;
        self.owner = owner;
        self.place = place;
    }
    
    func getID() -> Int {
        return id;
    }
    
    func getUsername() -> String {
        return username;
    }
    
    func getOwner() -> String {
        return owner;
    }
    
    func getPlace() -> String {
        return place;
    }
    
    
}
