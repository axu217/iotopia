//
//  CustomTabViewController.swift
//  ioTopia
//
//  Created by AXE07 on 10/28/16.
//  Copyright © 2016 ZheChengXu. All rights reserved.
//

import UIKit

class CustomTabViewController: UIViewController {
    
    @IBOutlet var container: UIView!
    
    lazy var sendViewController: SendCreditViewController = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        var viewController = storyboard.instantiateViewController(withIdentifier: "SendCreditViewController")
        
        self.switchChild(viewController: viewController)

        return viewController as! SendCreditViewController
    } ()
    
    lazy var homeViewController: HomeViewController = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        var viewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController")
        
        self.switchChild(viewController: viewController)
        
        return viewController as! HomeViewController
    } ()
    
    lazy var controlViewController: ControlViewController = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        var viewController = storyboard.instantiateViewController(withIdentifier: "ControlViewController")
        
        self.switchChild(viewController: viewController)
        
        return viewController as! ControlViewController
    } ()
    
    private func switchChild(viewController: UIViewController) {
        addChildViewController(viewController)
        
        container.addSubview(viewController.view)
        
        viewController.view.frame = container.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        viewController.didMove(toParentViewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView(index: 1)
    }
    
    func updateView(index: Int) {
        sendViewController.view.isHidden = (index != 0)
        homeViewController.view.isHidden = (index != 1)
        controlViewController.view.isHidden = (index != 2)
    }
    
    @IBAction func tabChange(_ sender: AnyObject) {
        let index = (sender as! UIButton).tag
        updateView(index: index)
        
    }
    
}
