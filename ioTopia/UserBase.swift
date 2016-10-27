//
//  UserBase.swift
//  ioTopia
//
//  Created by AXE07 on 10/26/16.
//  Copyright © 2016 ZheChengXu. All rights reserved.
//

import Foundation

class UserBase: NSObject {
    
    var userList = [User]();
    
    override init() {
        super.init()
    }
    
    func addUser(user: User) {
        userList.append(user);
    }
    
    func getList()->[User] {
        return userList;
    }
    
    
}
