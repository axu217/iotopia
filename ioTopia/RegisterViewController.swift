//
//  RegisterViewController.swift
//  ioTopia
//
//  Created by AXE07 on 10/15/16.
//  Copyright © 2016 ZheChengXu. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate  {
    
    let networkManager: NetworkManager = (UIApplication.shared.delegate as! AppDelegate).networkManager
    
    @IBOutlet var username: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var email: UITextField!
    
    
    override func viewDidLoad() {
        self.title = "Register"
        username.delegate = self
        password.delegate = self
        email.delegate = self
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LoginScreenViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        super.viewDidLoad()
        
        
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    

}
