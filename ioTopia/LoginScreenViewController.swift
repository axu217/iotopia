//
//  loginScreenViewController.swift
//  ioTopia
//
//  Created by AXE07 on 10/15/16.
//  Copyright © 2016 ZheChengXu. All rights reserved.
//

import UIKit
import EZLoadingActivity


class LoginScreenViewController: UIViewController, UITextFieldDelegate  {
    
    let networkManager: NetworkManager = (UIApplication.shared.delegate as! AppDelegate).networkManager

    
    @IBOutlet var username: UITextField!
    @IBOutlet var password: UITextField!
    
    override func viewDidLoad() {
        
        
        self.title = "Login"
        username.delegate = self
        password.delegate = self
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LoginScreenViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        super.viewDidLoad()
    }
    
    @IBAction func login(_ sender: UIButton) {
        _ = EZLoadingActivity.show("Loading...", disableUI: true)
        networkManager.login(username: username.text!, password: password.text!) {result, error in
            if(error == nil) {
                _ = EZLoadingActivity.hide(true, animated: true)
                self.performSegue(withIdentifier: "LoginToTab", sender: nil)

            } else {
                _ = EZLoadingActivity.hide(false, animated: true)
            }
        }
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.placeholder = ""
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.tag == 1 && textField.text == ""{
            textField.placeholder = "Email"
        } else if textField.tag == 2 && textField.text == "" {
            textField.placeholder = "Password"
        }
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
}
